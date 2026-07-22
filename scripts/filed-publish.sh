#!/usr/bin/env bash
set -Eeuo pipefail

# One predictable dogfood export for the public site and LLM workflows.
BORIS_BIN=${BORIS_BIN:-./bin/boris}
CONTENT_DIR=${CONTENT_DIR:-content}
PUBLISH_DIR=${PUBLISH_DIR:-publish}
THEME=${THEME:-themes/corp-vendor}

if [[ ! -x "$BORIS_BIN" ]]; then
  echo "ERROR: Boris binary is not executable: $BORIS_BIN" >&2
  echo "Set BORIS_BIN=/path/to/boris to use a local Boris build." >&2
  exit 2
fi

mkdir -p "$PUBLISH_DIR"

echo "==> Exporting Filed publishing artifacts to $PUBLISH_DIR"
echo "    Boris: $BORIS_BIN"
echo "    Input: $CONTENT_DIR"
echo "    Theme: $THEME"

"$BORIS_BIN" --input "$CONTENT_DIR" --theme "$THEME" --html-dir "$PUBLISH_DIR/site" -j 8 --quiet
"$BORIS_BIN" --input "$CONTENT_DIR" --out "$PUBLISH_DIR/ir" --quiet
"$BORIS_BIN" --input "$CONTENT_DIR" --rag-dir "$PUBLISH_DIR/rag" --quiet
"$BORIS_BIN" --input "$CONTENT_DIR" --context-dir "$PUBLISH_DIR/context" --quiet

if "$BORIS_BIN" --input "$CONTENT_DIR" --llms-path "$PUBLISH_DIR/llms.txt" --quiet; then
  echo "✅ llms.txt exported"
else
  echo "⚠️  llms.txt export is unavailable in this Boris build" >&2
fi

cat > "$PUBLISH_DIR/README.txt" <<'EOF'
Filed publishing artifacts

site/     Public HTML site (add a theme build here when publishing).
llms.txt  Public crawler/discovery index, when supported by Boris.
context/  Provenance-rich bundle for deliberate LLM context uploads.
rag/      Retrieval corpus for local or hosted RAG systems.
ir/       Machine-readable graph and reverse-index artifacts.

Review context/ and rag/ before uploading them. They are source-derived and
may include archived material or comments that should not become public canon.
EOF

echo "✅ Export complete"
echo "   Review $PUBLISH_DIR/README.txt before uploading context or RAG files."
