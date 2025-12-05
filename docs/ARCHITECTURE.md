## ARCHITECTURE.md — SYSTEM ARCHITECTURE DOSSIER (SAD-2)
Projet : empreinte_verif
Classification : CONFIDENTIEL — PRO MODE — ZERO-ERROR

----------------------------------------------------------------------
1. VISION GLOBALE — STRUCTURE DU SYSTÈME

L’architecture du projet repose sur quatre couches sécurisées :

  1. Flutter Web (UI)
  2. GitHub Repo Privé (source officielle)
  3. GitHub Actions (build + miroir)
  4. Vercel (hébergement + CDN + SPA routing)

Le miroir public garantit :
  - lecture automatique par agents GPT
  - sécurité du repo privé
  - synchronisation permanente

Objectifs :
  - pipeline automatisé
  - haute fiabilité
  - séparation stricte des rôles
  - zéro transfert manuel

----------------------------------------------------------------------
2. ARCHITECTURE LOGICIELLE — FLUTTER

2.1 Structure interne
  lib/
    main.dart
    ui/
    widgets/
    services/
    utils/
  web/
    index.html
    flutter_bootstrap.js
    manifest.json
    icons/
    assets/
    version.json

2.2 Exigences Flutter Web
  - Flutter configuré pour le Web
  - Build obligatoire :
      flutter build web --release
  - Support HTML/CanvasKit
  - Architecture SPA indispensable pour Vercel

2.3 Règles strictes
  - Ne jamais modifier build/web/
  - Modifier uniquement lib/ et web/
  - Toujours builder avant déploiement

----------------------------------------------------------------------
3. ARCHITECTURE INFRASTRUCTURE — CI/CD + MIRROR

3.1 Repo privé GitHub
Contient :
  - code Flutter
  - documentation militaire
  - workflows CI/CD
  - vercel.json
  - pubspec.yaml
Source de vérité absolue.

3.2 Repo public miroir
  URL : github.com/sanadidari/empreinte_verif_mirror
  Fonction :
    - lecture par agents GPT
    - transparence documentaire
    - stabilité
  Synchronisation :
    - mirror.yml → SSH → push --force

3.3 GitHub Actions (CI/CD)
Workflows critiques :

A. build_web.yml
  - installe Flutter
  - clean + pub get
  - build release
  - déploiement Vercel

B. mirror.yml
  - installe MIRROR_DEPLOY_KEY
  - configure remote ssh
  - force push vers miroir

Pipeline = autonome et auto-corrigeant.

----------------------------------------------------------------------
4. HÉBERGEMENT — VERCEL

4.1 Déploiement
  Serveur Web statique basé sur build/web.

4.2 Routage SPA (obligatoire)
  Toute requête doit pointer vers index.html.
  Évite les 404 sur navigation interne.

4.3 Domaines configurés
  - qrpruf.sanadidari.com
  - www.qrpruf.sanadidari.com

4.4 DNS
  - HostPapa gère DNS
  - CNAME : vercel-dns-017.com
  - SSL : actif automatiquement

----------------------------------------------------------------------
5. SÉCURITÉ — CLÉS ET SECRETS

Secrets obligatoires :
  - VERCEL_TOKEN
  - MIRROR_DEPLOY_KEY

Règles :
  - ne jamais exposer clé SSH privée
  - ne jamais committer build/web/
  - modifier workflows uniquement avec validation

----------------------------------------------------------------------
6. PIPELINE OPÉRATIONNEL (RÉSUMÉ)

Développeur push main
        ↓
GitHub Actions → build_web.yml
        ↓
Flutter build → déploiement Vercel
        ↓
CDN global + SPA routing
        ↓
Utilisateur final

Miroir :
push main → mirror.yml → sync automatique

----------------------------------------------------------------------
7. RISQUES TECHNIQUES IDENTIFIÉS

  - page blanche Flutter (SPA manquante)
  - assets non copiés
  - Vercel Token absent / invalide
  - clé SSH incorrecte pour le miroir
  - DNS lent ou incorrect

----------------------------------------------------------------------
FIN DU FICHIER — ARCHITECTURE.md v2.0 (FORMAT 80 COLONNES)
