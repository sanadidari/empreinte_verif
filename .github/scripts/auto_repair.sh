#!/usr/bin/env bash
# Auto-Repair v5.x — Military Autonomous Fix Engine
set -euo pipefail
IFS=$'\n\t'

WORKDIR="$(pwd)"
REPAIR_DIR="$WORKDIR/repair"
TIMESTAMP="$(date -u +'%Y%m%dT%H%M%SZ')"
REPORT="$REPAIR_DIR/auto_repair_$TIMESTAMP.txt"

mkdir -p "$REPAIR_DIR"

echo "=== AUTO REPAIR v5.x ===" > "$REPORT"
echo "Timestamp: $TIMESTAMP" >> "$REPORT"
echo "" >> "$REPORT"

msg() {
  echo "$1" | tee -a "$REPORT"
}

msg "[1] Running flutter pub get..."
flutter pub get || msg "[WARN] pub get failed"

msg "[2] Fixing formatting..."
flutter format . || msg "[WARN] format issues remain"

msg "[3] Checking pubspec.yaml validity..."
if ! grep -q "flutter:" pubspec.yaml; then
  msg "[CRITICAL] pubspec.yaml missing flutter: stanza"
fi

msg "[4] Rebuilding Flutter web..."
if flutter build web --release; then
  msg "[OK] Build succeeded"
else
  msg "[ERR] Build failed"
fi

msg "[5] Checking main.dart.js..."
if [ ! -f build/web/main.dart.js ]; then
  msg "[CRITICAL] main.dart.js missing after repair attempt"
fi

msg "[6] Checking index.html..."
if ! grep -q "<base href=\"/\">" build/web/index.html 2>/dev/null; then
  msg "[FIX] Rewriting base href in index.html"
  sed -i 's|<base href="[^"]*">|<base href="/">|' build/web/index.html || true
fi

msg "[FINAL] Auto repair completed. See full log."
