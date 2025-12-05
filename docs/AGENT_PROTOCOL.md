## AGENT_PROTOCOL.md — PROTOCOLE MILITAIRE v4.0
Projet : empreinte_verif
Classification : STRICT — ZERO-ERROR — FULL INTELLIGENCE — SELF-DIAGNOSIS

Objectif :
  Élever le système à un état d'autodiagnostic permanent. Chaque agent
  exécute automatiquement une suite complète d'analyses (SCANS) et met
  en place alertes & rapports. L'humain reste validateur visuel et
  décideur final pour les actions mutantes.

1. RÉSUMÉ DES CAPACITÉS v4.0
  - Auto-boot & auto-scan v3.0 (Git, Mirror, Docs, CI/CD, Domaine, Code).
  - SELF-DIAGNOSIS : exécution programmatique régulière (schedule + push)
    pour tests fonctionnels et de régression (build + http + dns + hashes).
  - SMART DIFF & IDS : détection de modifications suspectes.
  - ALERTS AUTOMATIQUES : création d'issues GitHub en cas d'anomalies critiques.
  - ARTIFACTS de diagnostic produits (logs, rapports, checksums).
  - OPTION : notifications Slack / Email via secret.

2. SCANS OBLIGATOIRES (Ordre + détails)
  - SCAN GIT (privé & miroir) : accès, hashes, sync status.
  - SCAN DOCS : lecture + cohérence.
  - SCAN CI/CD : parse workflows, vérifier presence Flutter install step.
  - SCAN CODE (FCI) : dart analyze, imports non-web, assets référencés.
  - SCAN BUILD : `flutter build web --release` (vérification de build success).
  - SCAN DOMAIN/HTTP : status HTTP, redirect chain, TLS expiry.
  - SCAN DNS : CNAME/records via dig.
  - SCAN ASSETS : calcul sha256 main.dart.js + assets, comparaison au baseline.
  - SCAN DIFF (IDS) : modifications massives, fichiers binaires, secrets exposés.
  - SCAN PRÉDICTIF : score de risque de build basé sur analyse + historique.

3. COMPORTEMENT SELF-DIAGNOSIS (exécution automatique)
  - Déclencheurs :
    • push sur main
    • schedule (cron daily — configurable)
    • manuel (via workflow_dispatch)
  - Actions :
    • exécuter `self_diagnose.sh`
    • collecter logs & outputs
    • produire artifact `diagnostics/<timestamp>.zip`
    • si CRITICAL → ouvrir GitHub Issue (template) + joindre résumé
  - Sévérité :
    • CRITICAL → bloque le déploiement recommandé (alerte humaine immédiate)
    • HIGH → patch suggestion + demande de validation
    • MEDIUM/LOW → consigner dans HISTORY.md

4. LIMITES & RÔLES
  - L'agent NE PEUT PAS exécuter commandes sur ta machine locale.
  - L'agent NE PEUT PAS pousser modifications mutantes sans ta validation.
  - L'humain : opérateur visuel, valide commit & push, installe APK sur mobile.

5. DÉPLOIEMENT & SECRETS
  - Workflows utilisent GITHUB_TOKEN (disponible automatiquement).
  - Optionnel : SLACK_WEBHOOK, NOTIFY_EMAIL pour alertes externes.

6. AUDIT & HISTORIQUE
  - Tous les diagnostics génèrent une entrée draft dans HISTORY.md
    (date / findings / hashes / actions recommandées).

FIN — AGENT_PROTOCOL.md v4.0
