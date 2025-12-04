✅ 3. Guide PRO pour les prochains agents (guide_agents.md)
Guide de Développement — Empreinte Verif
🎯 Objectif

Ce guide explique tout ce que doit savoir un nouveau développeur avant de travailler sur ce projet.

1️⃣ Démarrer rapidement
Installer Flutter :

Flutter SDK 3.x

Android Studio (SDK 33+)

Visual Studio Code recommandé

Lancer le projet :
flutter pub get
flutter run

Build Web :
flutter build web --release

2️⃣ Déploiement

Chaque push vers main déclenche automatiquement un build Vercel.

Commandes :
git add .
git commit -m "update"
git push

Attention :

✔ Ne jamais modifier directement build/web/
✔ Toujours modifier les fichiers originaux dans /web ou /lib
✔ Le build Web se régénère automatiquement

3️⃣ Organisation des dossiers
lib/        → code source principal
web/        → index.html + JS Flutter
docs/       → documentation du projet
build/web/  → version compilée (ne pas modifier)

4️⃣ Règles de contribution
✔ Ne jamais pousser un code non testé
✔ Toujours expliquer ce que tu modifies
✔ Toujours mettre un message de commit clair
✔ Respecter la roadmap
5️⃣ Architecture (résumé)

Flutter gère l’UI

Vercel gère la partie Web

L’API backend sera connectée via HTTP

Les assets sont servis statiquement

6️⃣ Ce qui reste à développer

API backend /scan

Scan biométrique natif Android

Dashboard de gestion

BD empreintes (cryptée)

7️⃣ Contact

Pour toute question → voir Samir Idari

🎉 Fin du guide