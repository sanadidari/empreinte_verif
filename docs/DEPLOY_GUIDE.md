## DEPLOY_GUIDE.md — VERCEL DEPLOYMENT DOSSIER (VDD-2.1)
Projet : empreinte_verif
Classification : OPÉRATIONNEL — CRITIQUE — ZERO-ERROR

Ce guide décrit la procédure officielle pour déployer l’application
Flutter Web via GitHub Actions et Vercel. Il remplace et fusionne les
anciens fichiers de déploiement, incluant VERCEL_DEPLOY.md.

----------------------------------------------------------------------
1. OBJECTIF

Garantir :
  - un déploiement automatique fiable
  - un pipeline reproductible
  - une configuration Flutter Web correcte
  - une intégration propre avec Vercel et DNS

Aucun autre mode de déploiement n’est autorisé.

----------------------------------------------------------------------
2. PRÉREQUIS OBLIGATOIRES

2.1 Flutter Web actif  
  flutter doctor  
  flutter config --enable-web  

2.2 Dépendances  
  flutter pub get  

2.3 Structure requise  
  pubspec.yaml  
  lib/  
  web/ (index.html + assets)  
  vercel.json  
  .github/workflows/build_web.yml  

2.4 Secrets GitHub  
  - VERCEL_TOKEN (obligatoire)  
  - MIRROR_DEPLOY_KEY (pour miroir, non pour déploiement)

2.5 DNS  
  qrpruf.sanadidari.com → CNAME → vercel-dns-017.com  
  SSL actif

----------------------------------------------------------------------
3. BUILD FLUTTER WEB

Commande officielle :

flutter clean  
flutter pub get  
flutter build web --release  

Output attendu :  
  build/web/

Interdiction : modifier manuellement build/web.

----------------------------------------------------------------------
4. CONFIGURATION VERCEL (IMPORT & PARAMÈTRES)

4.1 Import du projet  
  https://vercel.com/import  
  → Import GitHub Repository  
  → choisir : sanadidari/empreinte_verif  

4.2 Paramètres du build  
  Framework : Other  
  Build Command :
    flutter build web --release  
  Output Directory :
    build/web  

4.3 Déploiement  
  → Cliquer "Deploy"

----------------------------------------------------------------------
5. ROUTAGE SPA (OBLIGATOIRE)

Vercel doit rediriger toutes les routes vers index.html.

Fichier vercel.json :

```json
{
  "version": 2,
  "routes": [
    { "src": "/assets/(.*)", "dest": "/assets/$1" },
    { "src": "/icons/(.*)", "dest": "/icons/$1" },
    { "src": "/flutter_bootstrap.js", "dest": "/flutter_bootstrap.js" },
    { "src": "/main.dart.js", "dest": "/main.dart.js" },
    { "src": "/flutter.js", "dest": "/flutter.js" },
    { "src": "/canvaskit/(.*)", "dest": "/canvaskit/$1" },
    { "src": "/manifest.json", "dest": "/manifest.json" },
    { "src": "/version.json", "dest": "/version.json" },
    { "src": "/(.*)", "dest": "/index.html" }
  ]
}
```

Sans cette section : page blanche garantie.

----------------------------------------------------------------------
6. DÉPLOIEMENT VIA GITHUB ACTIONS

build_web.yml doit :
  - installer Flutter
  - exécuter flutter build web --release
  - installer Vercel CLI
  - déployer via token secret

Extrait minimal validé :

```yaml
- name: Build Flutter Web
  run: flutter build web --release

- name: Deploy to Vercel
  run: vercel deploy --prod --yes --token=$VERCEL_TOKEN build/web
```

----------------------------------------------------------------------
7. CHECKS APRÈS DÉPLOIEMENT

Vérifier sur l’URL preview :
  - main.dart.js chargé
  - aucune erreur console
  - assets présents
  - navigation interne OK (SPA)
  - fallback index.html opérationnel

Vérifier sur domaine final :
  https://qrpruf.sanadidari.com  
  https://www.qrpruf.sanadidari.com  

Tests obligatoires :
  - interface visible
  - responsive
  - pas de 404 interne
  - SSL OK

----------------------------------------------------------------------
8. MISE À JOUR DOCUMENTATION

Après un déploiement réussi, mettre à jour :
  - STATE_PROJECT.md
  - TASKS.md
  - HISTORY.md (si évènement majeur)

Inclure :
  - date du déploiement
  - hash du commit
  - URL du déploiement
  - statut final

----------------------------------------------------------------------
9. TROUBLESHOOTING

❌ Page blanche  
  - base-href incorrect  
  - assets manquants  
  - SPA fallback absent  

❌ Vercel Error: Flutter not found  
  → Flutter non installé dans le workflow

❌ 404 internes  
  → vercel.json incorrect  

❌ Erreur DNS / SSL  
  → CNAME non propagé  
  → vérification : dnschecker.org  

----------------------------------------------------------------------
FIN DU FICHIER — DEPLOY_GUIDE.md v2.1 (FORMAT 80 COLONNES)
