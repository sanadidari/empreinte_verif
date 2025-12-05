# CORRELATION_SPEC.md — Root-Cause Correlation Engine Spec

version: 1.0
engine: AI_Correlation

## Purpose
- Group related incidents from ROOT_CAUSE_DB.json into clusters.
- Provide a short suggestion for remediation per cluster.
- Help Auto-Heal Engine choose pre-made fixes or PR templates.

## Output
ROOT_CAUSE_CORRELATIONS.json:
- clusters: array of cluster objects:
  - cluster_id
  - signature
  - count
  - top_keywords
  - top_workflows
  - commits
  - incident_ids
  - suggestion

## Behavior
- Runs after AI Crash Investigator and RCDB updates.
- Updates CORR file; commit/push intended to main if allowed.
- Auto-Heal Engine can consult clusters to apply historical fixes.
