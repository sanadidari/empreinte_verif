# AGENT_PROTOCOL.md — MACHINE PROTOCOL v1.0
project: empreinte_verif
version: 1.0
scope: full-automation
status: active
generated_by: machine

# SECTION 1 — OBJECTIF DU PROTOCOLE
Le présent document définit l’intégralité du comportement autorisé et attendu du système agent-machine.
Objectifs :
- Automatisation totale
- Vérification continue
- Actions séquencées
- Zéro destruction sans ordre
- Gestion complète des workflows GitHub
- Synchronisation doc + code

# SECTION 2 — RÈGLES DE BOOT
Au démarrage, l’agent DOIT charger :
- docs/DOCS_MANIFEST.yaml
- docs/AGENT_START.md
- docs/NEXT_ACTION.md
- docs/TASKS.md
- docs/STATE_PROJECT.md

Puis vérifier la présence de :
- /lib
- /web
- /android
- /ios
- /.github/workflows

Puis analyser NEXT_ACTION.status :
- BLOCKING → STOP total
- OPEN → exécution autorisée

Puis produire :
[PROTOCOL INITIAL REPORT – LEVEL RED]

# SECTION 3 — SCANS OBLIGATOIRES
SCAN 1 — repo privé  
SCAN 2 — repo miroir  
SCAN 3 — docs complètes  
SCAN 4 — diff commits  
SCAN 5 — NEXT_ACTION  
SCAN 6 — workflows GitHub  
SCAN 7 — secrets GitHub  
SCAN 8 — structure Flutter  
SCAN 9 — derniers workflows  

Tous → rapport standardisé.

# SECTION 4 — FORMAT DES RAPPORTS
[REPORT TYPE – LEVEL X]
timestamp: <AUTO>
agent_version: <AUTO>
status: OK | WARNING | ERROR | BLOCKED
details:
  - key: value
next_action:
  id: <id>
  blocking: true|false

Types valides :
- PROTOCOL INITIAL REPORT – LEVEL RED
- DELTA REPORT – LEVEL BLUE
- STATUS REPORT – LEVEL ORANGE
- FINAL OPERATION REPORT – LEVEL GREEN
- HEARTBEAT REPORT – LEVEL WHITE

# SECTION 5 — SEQUENCE OFFICIELLE
ÉTAPE 1 — BOOT  
→ charger manifest & docs  
→ exécuter scans  
→ produire INITIAL REPORT  
→ STOP si BLOCKING

ÉTAPE 2 — SYNC  
→ comparer privé ↔ miroir  
→ DELTA REPORT  
→ STOP

ÉTAPE 3 — ANALYSE FLUTTER  
→ analyser structure  
→ STATUS REPORT  
→ STOP

ÉTAPE 4 — ACTION  
→ exécuter tâches  
→ mettre à jour docs, state, tasks  
→ FINAL OPERATION REPORT  
→ STOP TOTAL

# SECTION 6 — ERREURS
ERROR 01 — doc manquante  
ERROR 02 — manifest corrompu  
ERROR 03 — workflow absent  
ERROR 04 — secrets manquants  
ERROR 05 — flutter structure cassée  
ERROR 06 — déploiement échoué  
ERROR 07 — build cassé  
ERROR 08 — next_action invalide  
ERROR 09 — sync impossible  
ERROR 10 — heartbeat anomaly  

En cas d’erreur :
- rapport ERROR obligatoire
- proposer 3 solutions
- aucune action destructive

# SECTION 7 — MODE BLOQUANT
status = BLOCKING →
- ne rien exécuter
- ne rien modifier
- uniquement analyser + rapporter

# SECTION 8 — MODE AUTONOME
status = OPEN →
peut exécuter automatiquement :
- CI/CD
- post-tests
- rollback
- heartbeat
- sync

Doit mettre à jour :
- TASKS.md
- STATE_PROJECT.md
- HISTORY.md (si présent)

# SECTION 9 — MOTS CLÉS RÉSERVÉS
STOP  
EXECUTE  
VALIDER ÉTAPE <X>  
BLOCKING TRUE  
AUTO_MODE  

# SECTION 10 — FIN
Toute corruption → arrêt automatique du système.

END OF FILE
