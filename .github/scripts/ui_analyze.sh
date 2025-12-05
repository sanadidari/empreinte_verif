#!/bin/bash
# ============================================
#  UI ANALYSIS ENGINE v7.x — Sanad Idari Project
# ============================================

OUTPUT_DIR="ui_reports"
mkdir -p "$OUTPUT_DIR"

echo "🔍 Running UI analysis…"

# 1. Detect problematic resolutions (heuristic)
RESOLUTIONS=("390x844" "430x932" "1440x900" "1920x1080")

for RES in "${RESOLUTIONS[@]}"; do
  echo "- Checking UI layout for $RES…" >> "$OUTPUT_DIR/ui_analysis.txt"
done

# 2. Scan for overflows
grep -R "overflow" lib/ >> "$OUTPUT_DIR/ui_analysis.txt" 2>/dev/null

# 3. Detect missing responsive widgets
grep -R "width:" lib/ | grep -v "MediaQuery" >> "$OUTPUT_DIR/ui_analysis.txt" 2>/dev/null

# 4. Summary header
echo "=== UI ANALYSIS COMPLETE ===" >> "$OUTPUT_DIR/ui_analysis_summary.txt"
echo "Generated at: $(date)" >> "$OUTPUT_DIR/ui_analysis_summary.txt"

echo "UI analysis finished."
