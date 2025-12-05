## STATE_PROJECT.md — PROJECT STATUS INTEL REPORT (PSIR-2)
Projet : empreinte_verif
Classification : STRICT — OPÉRATIONNEL — ZERO-ERROR

----------------------------------------------------------------------
1. APERÇU OPÉRATIONNEL

Le projet empreinte_verif est une application Flutter Web déployée via :
  GitHub (repo privé) → GitHub Actions → Vercel → Domaine final.

Le système militaire GPT assure :
  - cohérence documentaire
  - exécution séquentielle
  - pipeline fiable
  - zéro improvisation

----------------------------------------------------------------------
2. STACK TECHNIQUE

Framework :
  - Flutter Web (Dart 3.x)
  - UI responsive
  - SPA architecture

Hébergement :
  - Vercel (Other framework)
  - CDN global
  - routage SPA

Pipeline CI/CD :
  - build_web.yml
  - mirror.yml
  - deploy automatique

Domaines :
  - qrpruf.sanadidari.com
  - www.qrpruf.sanadidari.com

----------------------------------------------------------------------
3. STRUCTURE REPOSITORY

Attendue et validée :
  /lib                → Code Flutter
  /web                → Entrée Flutter Web
  /docs               → Documentation militaire
  /build/web          → Build généré automatiquement
  /.github/workflows  → CI/CD
  pubspec.yaml        → Dépendances
  vercel.json         → Routage SPA

----------------------------------------------------------------------
4. INFRASTRUCTURE VERCEL

Build :
  flutter build web --release  
Output :
  build/web

Routing SPA :
  toutes les routes → index.html

DNS :
  qrpruf.sanadidari.com → CNAME → vercel-dns-017.com  
SSL actif

----------------------------------------------------------------------
5. INTELLIGENCE HISTORIQUE (SYNTHÈSE)

Résumé des événements majeurs :
  - Abandon HostPapa → Vercel
  - Migration DNS
  - Mise en place pipeline GitHub Actions
  - Résolution clés SSH / miroir
  - Documentation militaire v1 établie
  - Miroir public opérationnel
  - Passage complet en MODE MILITAIRE

----------------------------------------------------------------------
6. POINTS DE VIGILANCE

Surveiller :
  - page blanche Flutter Web
  - base-href incorrect
  - assets manquants
  - vercel.json cassé
  - MIRROR_DEPLOY_KEY incorrect
  - version Flutter incompatible
  - DNS non propagé

----------------------------------------------------------------------
7. ÉTAT GITHUB

Repo privé : empreinte_verif
  - accès : OK
  - branche : main
  - workflows :
      build_web.yml → OK
      mirror.yml    → OK
  - secrets :
      VERCEL_TOKEN → OK
      MIRROR_DEPLOY_KEY → OK

Repo public : empreinte_verif_mirror
  - synchro SSH
  - statut sync : à mettre à jour par agent
  - source unique de lecture

----------------------------------------------------------------------
8. STATE_CODE — ÉTAT CODE FLUTTER

Code Flutter :
  - /lib : stable
  - /web : stable
  - index.html : compatible Vercel
  - bootstrap : OK
  - manifest.json : OK
  - icons/ : OK
  - assets : OK
  - build local : stable

----------------------------------------------------------------------
9. STATE_INFRA — INFRASTRUCTURE

État :
  - GitHub Actions → fonctionnel
  - Miroir SSH     → fonctionnel
  - DNS            → fonctionnel
  - Pipeline       → opérationnel

----------------------------------------------------------------------
10. STATE_DOCS — DOCUMENTATION

Documentation militaire :
  - fichiers complets
  - protocole strict
  - cohérence garantie
  - lecture obligatoire validée

----------------------------------------------------------------------
11. MISSION LOG — TÂCHES

Terminé :
  - migration Vercel
  - pipeline CI/CD
  - miroir SSH
  - documentation militaire v2

En cours :
  - déploiement Flutter Web (NEXT_ACTION)

À faire :
  - tests pipeline complet
  - mise à jour docs après déploiement final

Bloqué :
  - aucun blocage rapporté

----------------------------------------------------------------------
FIN DU FICHIER — STATE_PROJECT.md v2.0 (FORMAT 80 COLONNES)
