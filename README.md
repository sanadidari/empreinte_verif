# empreinte_verif — Flutter Web + Vercel (PRO MODE)

Projet Flutter Web déployé automatiquement via :
  - GitHub (repo privé)
  - GitHub Actions (CI/CD)
  - Vercel (hébergement)
  - Miroir public GitHub (lecture agents GPT)

Ce dépôt utilise un système documentaire militaire garantissant :
  - précision
  - zéro erreur
  - cohérence inter-agents
  - pipeline stable et reproductible

----------------------------------------------------------------------
## 1. Structure principale du projet

lib/                → Code Flutter  
web/                → Entrée Flutter Web  
docs/               → Documentation militaire  
.github/workflows/  → CI/CD (build + miroir)  
vercel.json         → Routage SPA  
pubspec.yaml        → Dépendances  

----------------------------------------------------------------------
## 2. Pipeline CI/CD (Résumé)

Push sur main déclenche :
  - Build Flutter Web
  - Déploiement Vercel
  - Synchronisation miroir public

Workflows :
  - build_web.yml  
  - mirror.yml  

Secrets requis :
  - VERCEL_TOKEN
  - MIRROR_DEPLOY_KEY

----------------------------------------------------------------------
## 3. Documentation militaire

Toute la documentation opérationnelle se trouve dans :
  /docs/

Lecture obligatoire pour agents :
  - AGENT_PROTOCOL.md
  - STARTUP_CHECKLIST.md
  - NEXT_ACTION.md
  - STATE_PROJECT.md
  - RULES.md
  - ARCHITECTURE.md
  - DEPLOY_GUIDE.md
  - HISTORY.md
  - TASKS.md
  - CHECKLIST_MASTER.md

----------------------------------------------------------------------
## 4. Déploiement

Le build est généré par :
  flutter build web --release

Déployé automatiquement sur Vercel avec :
  build/web/

Routage SPA configuré dans vercel.json.

Domaines :
  https://qrpruf.sanadidari.com  
  https://www.qrpruf.sanadidari.com  

----------------------------------------------------------------------
## 5. Miroir public (source agents GPT)

URL miroir :
  https://github.com/sanadidari/empreinte_verif_mirror

Ce miroir fournit aux agents GPT un accès complet au code et à la
documentation sans exposer le repo privé.

----------------------------------------------------------------------
## 6. Licence

Projet propriétaire — Utilisation restreinte.  

----------------------------------------------------------------------
FIN DU FICHIER — README.md (FORMAT 80 COLONNES)
