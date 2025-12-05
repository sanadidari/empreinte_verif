## STARTUP_CHECKLIST.md — STARTUP PROTOCOL v3.0
Projet : empreinte_verif — Agents GPT — Full Intelligence

Cette checklist ordonne la séquence automatique que chaque agent exécute
au démarrage. L'humain reste opérateur visuel et valide les actions mutantes.

----------------------------------------------------------------------
1. VÉRIFICATION ACCÈS GIT

1.1 Repo privé
  - URL : https://github.com/sanadidari/empreinte_verif
  - Vérifier accès, RAW, /docs, /lib, /web
  - Récupérer dernier commit hash

1.2 Repo miroir public
  - URL : https://github.com/sanadidari/empreinte_verif_mirror
  - Vérifier accessibilité & hash miroir

----------------------------------------------------------------------
2. CHARGEMENT /docs (Ordre strict)
  1. AGENT_PROTOCOL.md
  2. STARTUP_CHECKLIST.md
  3. NEXT_ACTION.md
  4. STATE_PROJECT.md
  5. RULES.md
  6. ARCHITECTURE.md
  7. HISTORY.md
  8. DEPLOY_GUIDE.md
  9. TASKS.md
 10. CHECKLIST_MASTER.md (si présent)

----------------------------------------------------------------------
3. VÉRIFICATION STRUCTURE PROJET

- pubspec.yaml exists
- /lib non vide
- /web includes index.html + flutter_bootstrap.js
- .github/workflows includes build_web.yml & mirror.yml

----------------------------------------------------------------------
4. VÉRIFICATION SECRETS

- VERCEL_TOKEN exists
- MIRROR_DEPLOY_KEY exists
- Aucun secret ne doit être committé

----------------------------------------------------------------------
5. SCANS AUTOMATIQUES (exécutés sans demander)

5.1 Scan CI/CD
  - parse build_web.yml ; valider commandes
  - détecter mismatch flutter version

5.2 Scan DOMAINE (HTTP/SSL)
  - tester qrpruf.sanadidari.com & www
  - status code, redirect chain, cert validity
  - fallback index.html check (http status /headers)

5.3 Scan CODE (FCI)
  - analyser main.dart, routing, imports, assets refs
  - détecter patterns non-web
  - lister anomalies + patch suggestions

5.4 Scan INFRA
  - vercel.json routes
  - DNS CNAME presence
  - secrets names & existence

5.5 Scan DIFF
  - comparer avec baseline (dernier état validé)
  - alertes sur suppressions/ajouts suspects

----------------------------------------------------------------------
6. RAPPORT AUTOMATISÉ

L'agent produit :
  - [STARTUP CHECK COMPLETE] (format structuré)
  - inclut Domain scan & Code intelligence summary
  - enregistre un brouillon dans HISTORY.md (draft) si anomalies

Format :
  1. Repo privé: OK/NON
  2. Repo miroir: OK/NON
  3. Docs chargés: <liste>
  4. Dernier commit privé: <hash>
  5. Dernier commit miroir: <hash>
  6. Sync status: SYNC/OUTDATED
  7. NEXT ACTION: <contenu>
  8. Domain scan: <OK/WARN/FAIL>
  9. Code intelligence: <OK/WARN/FAIL>

----------------------------------------------------------------------
7. ACTIONS POST-SCAN

- Si Code intelligence = OK → l'agent propose d'exécuter NEXT_ACTION
  (doit attendre ta validation)
- Si anomalies critiques → l'agent propose patches et demandes visuelles
- Si anomalies infra/domaine → l'agent propose actions mitigantes

----------------------------------------------------------------------
8. RÔLE HUMAIN

Tu fournis :
  - captures d'écran console & network
  - validations pour commits mutatifs
  - exécution des commandes git locales (push)

----------------------------------------------------------------------

## STARTUP_CHECKLIST.md — STARTUP PROTOCOL v4.0
Projet : empreinte_verif — Self-Diagnosis

Ajouts v4.0 :
- Le mode SELF-DIAGNOSIS est actif : à chaque boot l'agent exécute
  la routine complète (v3.0) + déclenche le self_diagnose workflow si
  requis (si push ou schedule).

Checklist courte :
1. Vérifier miroir public accessible.
2. Charger /docs (ordre v4.0).
3. Lancer SCANS automatiques (Git, Docs, CI, Domaine, Code).
4. Si anomalies -> générer rapport et suggestion.
5. Pour anomalies CRITICAL -> attendre validation humaine.

FIN — STARTUP_CHECKLIST.md v4.0

