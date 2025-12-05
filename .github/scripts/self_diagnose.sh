#!/usr/bin/env bash
# .github/scripts/self_diagnose.sh
# Self-Diagnosis v4.x — Robust Military Edition
# Produces: diagnostics/report-<timestamp>.txt, diagnostics/assets-hashes-<timestamp>.txt,
#           diagnostics/index-<timestamp>.html, diagnostics/issue.json (if critical)
# Exit codes:
#   0 = OK (no criticals)
#   1 = WARNING (non-critical problems)
#   2 = CRITICAL (issue.json created)

set -euo pipefail
IFS=$'\n\t'

WORKDIR="$(pwd)"
DIAG_DIR="$WORKDIR/diagnostics"
TIMESTAMP="$(date -u +'%Y%m%dT%H%M%SZ')"
REPORT="$DIAG_DIR/report-$TIMESTAMP.txt"
ISSUE_JSON="$DIAG_DIR/issue.json"
ASSETS_HASHES="$DIAG_DIR/assets-hashes-$TIMESTAMP.txt"
INDEX_SNAPSHOT="$DIAG_DIR/index-$TIMESTAMP.html"
CRITICAL=0

mkdir -p "$DIAG_DIR"

echo "Self-Diagnosis v4.x — $TIMESTAMP" > "$REPORT"
echo "Repository: $(basename "$WORKDIR")" >> "$REPORT"
echo "Working dir: $WORKDIR" >> "$REPORT"
echo "" >> "$REPORT"

# --- 1) Git info
echo "=== GIT INFO ===" >> "$REPORT"
{
  git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "no-branch"
  git rev-parse --short HEAD 2>/dev/null || echo "no-commit"
  git log -n 3 --pretty=format:'%h %ad %s' --date=short 2>/dev/null || true
} >> "$REPORT" || true
echo "" >> "$REPORT"

# --- 2) Check required envs
echo "=== REQUIRED ENV CHECK ===" >> "$REPORT"
REQS_MISSING=()
needed_envs=(VERCEL_TOKEN)
for v in "${needed_envs[@]}"; do
  if [ -z "${!v:-}" ]; then
    REQS_MISSING+=("$v")
  fi
done
if [ "${#REQS_MISSING[@]}" -gt 0 ]; then
  echo "Missing required envs/secrets: ${REQS_MISSING[*]}" >> "$REPORT"
  # not critical (workflow uses secrets), mark warning
  WARNING_MSG="Missing required envs: ${REQS_MISSING[*]}"
else
  echo "All required envs present or optional." >> "$REPORT"
fi
echo "" >> "$REPORT"

# --- Helper function: safe_run (captures output)
safe_run() {
  local cmd="$1"; shift
  echo "\$ $cmd" >> "$REPORT"
  if eval "$cmd" >> "$REPORT" 2>&1; then
    echo "[OK] $cmd" >> "$REPORT"
    return 0
  else
    echo "[ERR] $cmd" >> "$REPORT"
    return 1
  fi
}

# --- 3) Flutter analyze (static)
echo "=== FLUTTER ANALYZE ===" >> "$REPORT"
if command -v flutter >/dev/null 2>&1; then
  # run pub get but tolerate failure (network)
  safe_run "flutter pub get || true"
  if safe_run "flutter analyze --no-fatal-infos"; then
    echo "ANALYZE: OK" >> "$REPORT"
  else
    echo "ANALYZE: Issues detected (see above)" >> "$REPORT"
  fi
else
  echo "Flutter not available in runner. Skipping analyze." >> "$REPORT"
fi
echo "" >> "$REPORT"

# --- 4) Build web (attempt) but non-fatal in diagnosis stage
echo "=== BUILD WEB ===" >> "$REPORT"
BUILD_OK=0
if command -v flutter >/dev/null 2>&1; then
  if safe_run "flutter build web --release -v"; then
    BUILD_OK=1
    echo "BUILD: OK" >> "$REPORT"
  else
    echo "BUILD: FAILED (diagnosis continues to collect evidence)" >> "$REPORT"
  fi
else
  echo "BUILD: skipped (flutter not present)" >> "$REPORT"
fi
echo "" >> "$REPORT"

# --- 5) Assets hash if build present
echo "=== ASSETS HASH ===" >> "$REPORT"
if [ -d "build/web" ]; then
  (
    cd build/web
    # find files, sort, hash
    find . -type f -not -path "./canvaskit/*" -print0 | sort -z | xargs -0 sha256sum > "$ASSETS_HASHES" || true
  )
  echo "Hashes written: $ASSETS_HASHES" >> "$REPORT"
else
  echo "No build/web directory found; skipping asset hash." >> "$REPORT"
fi
echo "" >> "$REPORT"

# --- 6) HTTP / SSL checks
DOMAIN="${DOMAIN:-qrpruf.sanadidari.com}"
echo "=== HTTP / SSL CHECK for $DOMAIN ===" >> "$REPORT"
HTTP_STATUS="000"
if command -v curl >/dev/null 2>&1; then
  # follow redirects, timeout 15s
  HTTP_STATUS="$(curl -s -L -o /dev/null -w '%{http_code}' --max-time 15 "https://$DOMAIN" || echo "000")"
  echo "HTTP status: $HTTP_STATUS" >> "$REPORT"
  # fetch index for snapshot
  curl -s -L --max-time 15 "https://$DOMAIN" -o "$INDEX_SNAPSHOT" || true
  echo "Index snapshot: $INDEX_SNAPSHOT" >> "$REPORT"
else
  echo "curl not available; cannot perform HTTP checks." >> "$REPORT"
fi

# TLS expiry check (openssl)
if command -v openssl >/dev/null 2>&1; then
  echo "" >> "$REPORT"
  echo "TLS Certificate details:" >> "$REPORT"
  {
    echo | openssl s_client -servername "$DOMAIN" -connect "$DOMAIN:443" 2>/dev/null \
      | openssl x509 -noout -dates -issuer -subject 2>/dev/null || echo "openssl-check-failed"
  } >> "$REPORT" 2>&1 || true
else
  echo "openssl not available; skipping TLS check." >> "$REPORT"
fi
echo "" >> "$REPORT"

# --- 7) DNS checks (dig or nslookup fallback)
echo "=== DNS CHECK ===" >> "$REPORT"
if command -v dig >/dev/null 2>&1; then
  safe_run "dig +short CNAME $DOMAIN || true"
  safe_run "dig +short A $DOMAIN || true"
elif command -v nslookup >/dev/null 2>&1; then
  safe_run "nslookup -type=CNAME $DOMAIN || true"
  safe_run "nslookup $DOMAIN || true"
else
  echo "No dig or nslookup found; skipping DNS checks." >> "$REPORT"
fi
echo "" >> "$REPORT"

# --- 8) Basic asset existence checks (index + manifest + main.dart.js)
echo "=== ASSET PRESENCE CHECK ===" >> "$REPORT"
MISSING_ASSETS=()
if [ -f "build/web/index.html" ]; then
  echo "build/web/index.html exists" >> "$REPORT"
else
  MISSING_ASSETS+=("build/web/index.html")
fi
if [ -f "build/web/main.dart.js" ]; then
  echo "build/web/main.dart.js exists" >> "$REPORT"
else
  MISSING_ASSETS+=("build/web/main.dart.js")
fi
if [ -f "build/web/manifest.json" ]; then
  echo "build/web/manifest.json exists" >> "$REPORT"
else
  MISSING_ASSETS+=("build/web/manifest.json")
fi

if [ "${#MISSING_ASSETS[@]}" -gt 0 ]; then
  echo "Missing assets: ${MISSING_ASSETS[*]}" >> "$REPORT"
fi
echo "" >> "$REPORT"

# --- 9) Evaluate rules to mark CRITICAL / WARNING
echo "=== EVALUATION ===" >> "$REPORT"
if [ "$HTTP_STATUS" != "200" ]; then
  echo "EVALUATION: HTTP status is $HTTP_STATUS (not 200) => warning/critical" >> "$REPORT"
  # treat non-200 as critical for this pipeline
  CRITICAL=1
fi
if [ "${#MISSING_ASSETS[@]}" -gt 0 ]; then
  echo "EVALUATION: Missing assets detected" >> "$REPORT"
  CRITICAL=1
fi
if [ "$BUILD_OK" -ne 1 ]; then
  echo "EVALUATION: Build failed or not executed" >> "$REPORT"
  # build failures often critical
  CRITICAL=1
fi

# --- 10) If critical, prepare issue JSON (for GH action to post)
if [ "$CRITICAL" -ne 0 ]; then
  SUMMARY="Self-Diagnosis CRITICAL for $DOMAIN at $TIMESTAMP"
  BODY="Auto-diagnostic detected critical problems.\n\nSummary:\n"
  BODY+="HTTP status: $HTTP_STATUS\n"
  if [ "${#MISSING_ASSETS[@]}" -gt 0 ]; then
    BODY+="Missing assets: ${MISSING_ASSETS[*]}\n"
  fi
  if [ "$BUILD_OK" -ne 1 ]; then
    BODY+="Build: FAILED or not run\n"
  fi
  BODY+="\nFull report attached in diagnostics/report-$TIMESTAMP.txt\n"
  # create JSON object
  cat > "$ISSUE_JSON" <<EOF
{
  "title": "$(echo "$SUMMARY" | sed 's/"/\\"/g')",
  "body": "$(echo -e "$BODY" | sed 's/"/\\"/g')"
}
EOF
  echo "Created issue JSON: $ISSUE_JSON" >> "$REPORT"
fi

# --- 11) Finalize report & exit code
cp "$REPORT" "$DIAG_DIR/report-latest.txt" || true
echo "Report saved: $REPORT"

if [ -f "$ISSUE_JSON" ]; then
  echo "CRITICAL issues found. Issue JSON present: $ISSUE_JSON"
  echo "Diagnostics complete: CRITICAL"
  exit 2
fi

# If warnings exist but not critical
if grep -qi "ANALYZE: Issues detected" "$REPORT" 2>/dev/null || [ -n "${WARNING_MSG:-}" ]; then
  echo "Warnings detected (non-critical)."
  exit 1
fi

echo "No critical issues. Diagnostics OK."
exit 0
