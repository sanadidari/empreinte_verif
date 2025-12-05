# CHECKLIST_MASTER.md — MACHINE CONTROL CHECKLIST v1.0
project: empreinte_verif
generated_by: machine
version: 1.0
last_update: auto

# ────────────────────────────────────────────────
# SECTION 1 — PRESENCE DES FICHIERS CRITIQUES
# ────────────────────────────────────────────────
required_docs:
  - docs/AGENT_START.md
  - docs/NEXT_ACTION.md
  - docs/DOCS_MANIFEST.yaml
  - docs/DOCS_SCAN_INSTRUCTIONS.md
  - docs/STATE_PROJECT.md
  - docs/TASKS.md
  - docs/AGENT_PROTOCOL.md
  - docs/CHECKLIST_MASTER.md

required_workflows:
  - .github/workflows/ci_cd.yml
  - .github/workflows/rollback.yml
  - .github/workflows/post_deploy_tests.yml
  - .github/workflows/healthcheck.yml
  - .github/workflows/agent_trigger.yml
  - .github/workflows/agent_heartbeat.yml

# ────────────────────────────────────────────────
# SECTION 2 — VALIDATION DU MANIFEST
# ────────────────────────────────────────────────
manifest_rules:
  must_contain:
    - "manifest_version"
    - "project:"
    - "repo_private:"
    - "repo_mirror:"
    - "scan_order:"
    - "file_patterns:"
    - "scan_mode:"

# ────────────────────────────────────────────────
# SECTION 3 — VERIFICATION DE LA STRUCTURE FLUTTER
# ────────────────────────────────────────────────
flutter_structure:
  required_paths:
    - pubspec.yaml
    - lib/
    - web/
    - android/
    - ios/
    - .github/workflows/

web_required_files:
  - web/index.html
  - web/manifest.json
  - web/flutter_bootstrap.js
  - web/icons/

flutter_build_targets:
  - command: "flutter build web --release"
    output: "build/web"
    must_contain:
      - index.html
      - main.dart.js
      - flutter_bootstrap.js

# ────────────────────────────────────────────────
# SECTION 4 — VERIFICATION DES SECRETS
# ────────────────────────────────────────────────
required_secrets:
  - VERCEL_TOKEN
  - VERCEL_ORG_ID
  - VERCEL_PROJECT_ID

secret_validation_policy:
  if_missing: "BLOCK_OPERATION"
  message: "Secrets Vercel manquants — impossible de déployer."

# ────────────────────────────────────────────────
# SECTION 5 — VERIFICATION NEXT_ACTION
# ────────────────────────────────────────────────
next_action_rules:
  must_have:
    - "status:"
    - "action_id:"
    - "priority:"
    - "execution_mode:"
  blocking_status_values:
    - BLOCKING
    - HOLD
    - MANUAL_REQUIRED

agent_behavior:
  if_blocking: "STOP_AND_REPORT"
  if_open: "CONTINUE_AUTOMATION"

# ────────────────────────────────────────────────
# SECTION 6 — VERIFICATION DU SYSTEME DE TACHES
# ────────────────────────────────────────────────
tasks_validation:
  required_fields:
    - id
    - title
    - status
    - priority
    - auto_execute
    - depends_on
  allowed_status:
    - PENDING
    - IN_PROGRESS
    - DONE
    - BLOCKED

task_policy:
  missing_task: "ERROR_REPORT"
  invalid_status: "ERROR_REPORT"

# ────────────────────────────────────────────────
# SECTION 7 — WORKFLOWS DIAGNOSTICS
# ────────────────────────────────────────────────
workflow_health_rules:
  must_exist: true
  require_recent_success: true
  max_failures_allowed: 2

health_triggers:
  - heartbeat
  - post-deploy-tests
  - ci_cd
  - rollback

# ────────────────────────────────────────────────
# SECTION 8 — RESULTAT FINAL
# ────────────────────────────────────────────────
result_mapping:
  all_checks_passed: "READY_FOR_AUTOMATION"
  some_warnings: "READY_WITH_WARNINGS"
  blocking_error: "STOP_OPERATION"

exit_conditions:
  on_error: "AGENT_STOPS_AND_REPORTS"
  on_warning: "AGENT_CONTINUES_BUT_NOTES"
  on_success: "AGENT_CONTINUES_FULLY"

# END OF FILE
