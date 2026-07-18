#!/usr/bin/env bash
set -euo pipefail

PYTHON_BIN="${PYTHON_BIN:-python3}"

if ! command -v "$PYTHON_BIN" >/dev/null 2>&1; then
  echo "[ERROR] Python not found: $PYTHON_BIN" >&2
  exit 1
fi

echo "[INFO] Using Python: $PYTHON_BIN"
"$PYTHON_BIN" --version

echo "[INFO] Upgrading pip"
"$PYTHON_BIN" -m pip install -U pip

echo "[INFO] Installing Python dependencies"
"$PYTHON_BIN" -m pip install -U cloakbrowser playwright pandas beautifulsoup4

echo "[INFO] Installing Playwright Linux dependencies (best-effort)"
if ! "$PYTHON_BIN" -m playwright install-deps chromium; then
  echo "[WARN] playwright install-deps failed (continuing)"
fi

echo "[INFO] Ensuring CloakBrowser binary"
"$PYTHON_BIN" - <<'PY'
from cloakbrowser import ensure_binary, binary_info

ensure_binary()
print(binary_info())
PY

echo ""
echo "[DONE] Setup complete."
echo "Next steps:"
echo "  1) Run notebook/script cells from: cloakbrowser_colab_browser_automation_tutorial_Marktechpost.ipynb.txt"
echo "  2) Check artifacts under: artifacts/cloakbrowser_advanced_tutorial"
