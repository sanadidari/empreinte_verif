📄 NEXT_ACTION.md — PROTOCOL TASK ORDER (PTO-1)
Projet : empreinte_verif — Niveau : TOP PRIORITY — Zero-Error
🎯 Mission Actuelle (Unique, Bloquante, Obligatoire)

La prochaine action opérationnelle définie pour ce projet, au moment présent, est :

🟥 NEXT ACTION — Vérification & Exécution du pipeline Flutter Web + Vercel
Objectif :

Garantir que la chaîne suivante fonctionne parfaitement :

GitHub (repo privé) 
    → Workflow build_web.yml 
    → Production du dossier build/web 
    → Déploiement automatique via Vercel (VERCEL_TOKEN)
    → Publication finale sur domaine qrpruf.sanadidari.com


Cette action est la seule autorisée jusqu’à finalisation complète.

📌 Pourquoi cette action ? (justification militaire)

Selon STATE_PROJECT.md et TASKS.md :

Le code Flutter est stable

Le système de mirroring privé → public est opérationnel

L’infrastructure GitHub Actions a été rétablie

Le domaine qrpruf.sanadidari.com pointe vers Vercel

Le fichier vercel.json est correct

Le workflow build_web.yml est en place

Donc :
👉 Le projet est prêt pour un déploiement automatique fiable.

🔧 Prérequis obligatoires

Avant d’exécuter cette action, l’agent doit vérifier :

A — Côté GitHub

build_web.yml existe et est valide

Secret : VERCEL_TOKEN → présent

Secret : MIRROR_DEPLOY_KEY → présent

Flutter Web → activé dans workflow

build command : flutter build web --release

output directory : build/web

B — Côté projet Flutter

/web/ contient index.html

/web/ contient flutter_bootstrap.js

/web/ contient icons/, assets/, manifest.json

base-href correct dans index.html

C — Côté Vercel

Vercel projet connecté au repo privé

Domaine configuré : qrpruf.sanadidari.com

CNAME actif : vercel-dns-017.com

SSL activé

🛠 Étapes exactes que l’agent doit exécuter (UNE PAR UNE)
1️⃣ Vérifier le workflow build_web.yml

Confirmer que :

flutter clean
flutter pub get
flutter build web --release


sont présents.

2️⃣ Lancer un test de build (dry run)

L’agent doit vérifier :

taille du main.dart.js

absence d’erreurs console

absence d’assets manquants

3️⃣ Déclencher un déploiement Vercel via GitHub Actions

En faisant un git commit minimal.

4️⃣ Analyser le log Vercel

Chercher :

erreurs d’assets

erreurs de routage

erreurs de compression

404 internes

5️⃣ Confirmer le déploiement

Sur :

https://qrpruf.sanadidari.com
https://www.qrpruf.sanadidari.com

6️⃣ Mettre à jour documentation

Obligatoire :

STATE_PROJECT.md

TASKS.md

HISTORY.md (optionnel)

🟩 Définition de DONE

L’action est considérée réussie lorsque :

✔ Workflow build_web.yml s’exécute sans erreur
✔ Vercel déploie automatiquement
✔ Le site s’ouvre sans page blanche
✔ Aucune erreur console Flutter Web
✔ Le domaine personnalisé fonctionne
✔ Les docs sont mises à jour

🟥 Après finalisation (uniquement ensuite)

La prochaine action possible sera créée et validée manuellement par l’utilisateur.

🟥 FIN DU FICHIER 3/10 — NEXT_ACTION.md