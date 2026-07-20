#!/bin/bash
set -eo pipefail

echo "==> Running Boris Graph Integrity Check..."
# Run boris check and capture output. It exits 1 on findings (like unreferenced pages),
# but we only want to fail on hard errors.
CHECK_OUTPUT=$(./bin/boris check --input content 2>&1 || true)

# Search for critical errors in the check output.
if echo "$CHECK_OUTPUT" | grep -Ei "error:|panic:" > /dev/null; then
    echo "❌ Critical structural/validation error detected in graph check:"
    echo "$CHECK_OUTPUT" | grep -Ei "error:|panic:"
    exit 1
fi

echo "✅ Graph Integrity Check passed (no critical errors/panics found)."

# Define themes and their respective output directories
THEMES=("themes/corp-vendor" "themes/google-material" "themes/cozy-typepad")
OUTPUT_DIRS=("dist/corp" "dist/material" "dist/cozy")

for i in "${!THEMES[@]}"; do
    THEME="${THEMES[$i]}"
    OUT_DIR="${OUTPUT_DIRS[$i]}"
    echo "==> Compiling site with theme: $THEME to $OUT_DIR..."
    if ! ./bin/boris --input content --theme "$THEME" --html-dir "$OUT_DIR" -j 8; then
        echo "❌ Compilation failed for theme: $THEME"
        exit 1
    fi
    echo "✅ Theme $THEME compiled successfully."
done

echo "🎉 All validations and compilations passed successfully!"
exit 0
