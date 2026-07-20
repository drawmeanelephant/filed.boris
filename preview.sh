#!/usr/bin/env bash
set -e

PORT=${1:-8000}
THEME=${2:-corp-vendor}
DIST_DIR="dist"

echo "====================================================="
echo "🏢 Filed & Forgotten Archive — Local Preview Server"
echo "====================================================="
echo "Building site with theme '${THEME}' using Boris..."

./bin/boris --input content --theme "themes/${THEME}" --html-dir "${DIST_DIR}" -j 8

echo ""
echo "✅ Site build complete! HTML output written to './${DIST_DIR}'."
echo "🚀 Launching local HTTP server at: http://localhost:${PORT}"
echo "Press Ctrl+C to stop the server."
echo "====================================================="

python3 -m http.server "${PORT}" --directory "${DIST_DIR}"
