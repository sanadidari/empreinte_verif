📘 Empreinte Verif — Documentation Projet (Status & Process)

Auteur : Sanad Idari
Dernière mise à jour : 04/12/2025
Statut : En développement – Phase Web Deploy OK

🧭 1. Résumé du Projet

Empreinte Verif est une application Flutter permettant de :

✔ Scanner une empreinte digitale
✔ Vérifier l'identité via une API (future intégration)
✔ Fonctionner entièrement sur mobile et web
✔ Être déployée sur Vercel en version Web

🚀 2. Avancement Actuel (04/12/2025)
✔ FRONT-END Flutter
Fonction	Statut
UI Page principale (Scanner empreinte)	✔ Terminé
Thème & police Cairo	✔ Terminé
Gestion responsive Web	✔ Terminé
Structure Flutter stable	✔ Terminé
✔ WEB DEPLOY (Vercel)
Fonction	Statut
Build Flutter Web	✔ OK
Index.html base-href corrigé	✔ OK
vercel.json configuré	✔ OK
Routing Web Functions (flutter.js, bootstrap…)	✔ OK
Page blanche / 404 corrigée	✔ Résolu
🟦 BACKEND API (à venir)
Fonction	Statut
Endpoint /scan	⏳ À faire
Envoi de l’image (base64)	⏳ À faire
Analyse empreinte	⏳ À faire
Base de données	⏳ À faire
📲 MOBILE
Fonction	Statut
Scan empreinte via biométrie	⏳ À implémenter
Permissions Android	⏳ À faire
Tests physiques	⏳ À faire
🧱 3. Structure du Projet
empreinte_verif/
 ├─ lib/
 │   ├─ main.dart
 │   └─ ui/
 │       └─ home.dart
 ├─ web/
 │   ├─ index.html
 │   ├─ flutter_bootstrap.js
 │   ├─ manifest.json
 │   ├─ version.json
 │   └─ icons/
 ├─ build/web/   ← version compilée pour Vercel
 ├─ vercel.json
 └─ docs/   ← documentation projet

🛠 4. Guide Développeur
4.1. Lancer le projet
flutter pub get
flutter run

4.2. Build Web
flutter build web --release

4.3. Déployer sur Vercel

Commit + push sur main

Vercel build automatiquement

L’URL de production est mise à jour

🌐 5. Config Vercel
vercel.json utilisé actuellement
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

📈 6. Roadmap (Prochaines étapes)
🟩 Étape 1 — API Backend

Définir format JSON d’entrée

Recevoir empreinte (base64)

Générer réponse JSON

Implémenter sécurité (token)

🟩 Étape 2 — Intégration API dans Flutter

Appeler API /scan

Afficher résultat

Gestion erreurs

🟦 Étape 3 — Mobile Features

Scanner biométrique natif Android

Permissions hardware

Tests sur smartphones réels

🟨 Étape 4 — Optimisations

UI améliorée

Système logs

Internationalisation (optionnel)

👥 7. Pour les Agents qui rejoignent le projet

Bienvenue dans l’équipe 👋

Voici les règles :

1. Toujours lire ce document au début

Tout l’avancement est ici.

2. Toujours utiliser la branche main

Déploiement automatique.

3. Pour toute modification Flutter
flutter clean
flutter pub get
flutter run

4. Pour déploiement Web
flutter build web --release
git add .
git commit -m "update"
git push

5. Toute question technique → demander à Samir
📝 8. Historique rapide du projet
Date	Action
02/12/2025	Initialisation Flutter
03/12/2025	Ajout UI scanner
03/12/2025	Premier build Web
04/12/2025	Fix vercel.json
04/12/2025	Résolution page blanche / 404
04/12/2025	Déploiement Web opérationnel
🎯 Conclusion

Le projet est fonctionnel sur le web, stable, propre et prêt pour :

➡ L’intégration API
➡ Le développement mobile
➡ Les tests utilisateurs