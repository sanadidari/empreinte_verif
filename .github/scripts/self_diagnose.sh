#!/usr/bin/env bash
set -euo pipefail

WORKDIR="$(pwd)"
DIAG_DIR="$WORKDIR/diagnostics"
TIMESTAMP=$(date -u +"%Y%m%dT%H%M%SZ")
mkdir -p "$DIAG_DIR"

DOMAIN="${DOMAIN:-qrpruf.sanadidari.com}"
REPORT="$DIAG_DIR/report-$TIMESTAMP.txt"
ISSUE_JSON="$DIAG_DIR/issue.json"

echo "Self-diagnose v4.0 - $TIMESTAMP" > "$REPORT"
echo "Working dir: $WORKDIR" >> "$REPORT"
echo "" >> "$REPORT"

# 1) Git status & last commits
echo "=== GIT INFO ===" >> "$REPORT"
git rev-parse --abbrev-ref HEAD >> "$REPORT" 2>/dev/null || true
git log -n 3 --pretty=format:'%h %ad %s' --date=short >> "$REPORT" 2>/dev/null || true
echo "" >> "$REPORT"

# 2) Dart/Flutter analyze (static)
echo "=== FLUTTER ANALYZE ===" >> "$REPORT"
if flutter --version >/dev/null 2>&1; then
  flutter pub get >> "$REPORT" 2>&1 || true
  if flutter analyze --no-fatal-infos >> "$REPORT" 2>&1; then
    echo "ANALYZE OK" >> "$REPORT"
  else
    echo "ANALYZE: issues found (see above)" >> "$REPORT"
  fi
else
  echo "Flutter not installed in runner" >> "$REPORT"
fi
echo "" >> "$REPORT"

# 3) Try build (release web) — capture result
echo "=== BUILD WEB ===" >> "$REPORT"
BUILD_OK=0
if flutter build web --release -v >> "$REPORT" 2>&1; then
  echo "BUILD OK" >> "$REPORT"
  BUILD_OK=1
else
  echo "BUILD FAILED" >> "$REPORT"
fi
echo "" >> "$REPORT"

# 4) Calculate assets hash (if build exists)
echo "=== ASSETS HASH ===" >> "$REPORT"
if [ -d "build/web" ]; then
  cd build/web
  find . -type f -not -path "./canvaskit/*" -print0 | sort -z | xargs -0 sha256sum > "$WORKDIR/$DIAG_DIR/assets-hashes-$TIMESTAMP.txt" || true
  echo "Hashes written to diagnostics/assets-hashes-$TIMESTAMP.txt" >> "$REPORT"
  cd "$WORKDIR"
else
  echo "No build/web directory found" >> "$REPORT"
fi
echo "" >> "$REPORT"

# 5) HTTP/SSL check (curl + openssl)
echo "=== HTTP / SSL CHECK ===" >> "$REPORT"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "https://$DOMAIN" || echo "000")
echo "HTTP Status code for https://$DOMAIN : $HTTP_CODE" >> "$REPORT"

# TLS expiry
echo "" >> "$REPORT"
echo "TLS certificate details:" >> "$REPORT"
echo | openssl s_client -servername "$DOMAIN" -connect "$DOMAIN:443" 2>/dev/null | openssl x509 -noout -dates -issuer -subject >> "$REPORT" 2>&1 || echo "openssl check failed" >> "$REPORT"
echo "" >> "$REPORT"

# 6) DNS check
echo "=== DNS CHECK ===" >> "$REPORT"
if command -v dig >/dev/null 2>&1; then
  dig +short CNAME "$DOMAIN" >> "$REPORT" 2>&1 || echo "dig failed" >> "$REPORT"
  dig +short A "$DOMAIN" >> "$REPORT" 2>&1 || true
else
  echo "dig not available" >> "$REPORT"
fi
echo "" >> "$REPORT"

# 7) Quick runtime smoke test (headless fetch index)
echo "=== SMOKE FETCH index.html ===" >> "$REPORT"
curl -s -L "https://$DOMAIN" -o "$DIAG_DIR/index-$TIMESTAMP.html" || true
echo "Saved index to diagnostics/index-$TIMESTAMP.html" >> "$REPORT"
echo "" >> "$REPORT"

# 8) Evaluate pass/fail rules
CRITICAL=0
if [ "$HTTP_CODE" != "200" ]; then
  CRITICAL=1
  echo "CRITICAL: HTTP status is $HTTP_CODE" >> "$REPORT"
fi
if [ "$BUILD_OK" -ne 1 ]; then
  CRITICAL=1
  echo "CRITICAL: build failed" >> "$REPORT"
fi

# 9) If critical -> create issue.json
if [ "$CRITICAL" -eq 1 ]; then
  ISSUE_TITLE="Self-Diagnosis CRITICAL — $DOMAIN — $TIMESTAMP"
  ISSUE_BODY="Auto-diagnostic found CRITICAL problem(s).\n\nSee report attached.\n\nSummary:\n"
  ISSUE_BODY+="HTTP status: $HTTP_CODE\n"
  if [ "$BUILD_OK" -ne 1 ]; then
    ISSUE_BODY+="Build: FAILED\n"
  fi
  jq -n --arg t "$ISSUE_TITLE" --arg b "$ISSUE_BODY" '{title:$t, body:$b}' > "$ISSUE_JSON"
  echo "Created $ISSUE_JSON"
fi

# 10) Write final report (human readable)
cp "$REPORT" "$DIAG_DIR/report-latest.txt"
echo "Report created: $REPORT"
echo "Diagnostics folder: $DIAG_DIR"
