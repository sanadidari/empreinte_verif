📄 README.md — VERSION Enterprise PRO (à coller)
# SANAD IDARI — empreinte_verif  
### Flutter Web • Vercel • Pipeline GitHub • Documentation PRO

Ce dépôt contient le projet **Sanad Idari — empreinte_verif**, une application **Flutter Web** déployée automatiquement sur **Vercel** via la branche Git `main`.

L’objectif du projet est de fournir un module de vérification administrative (QR / empreinte) via une interface Web moderne, fiable et hautement maintenable.

---

# 🏗️ Architecture Technique

## 🔷 Stack
- **Flutter Web**
- **Dart**
- **Vercel** (hébergement & CDN global)
- **GitHub** (source of truth)
- **CI/CD automatique** via `git push origin main`

## 🔷 Structure du projet



/
├── lib/ # Code Flutter
├── web/ # Entrée Flutter Web (index.html, icons...)
├── build/web/ # Généré par flutter build web --release
├── docs/ # Documentation PRO des agents GPT
├── pubspec.yaml # Dépendances Flutter
└── vercel.json (optionnel) # Routage SPA


---

# 🚀 Pipeline de Déploiement

## 🔹 Workflow complet


Développeur → Git push main → Vercel Build → Vercel Deploy → Domaine final


## 🔹 Commande de build


flutter build web --release


## 🔹 Output utilisé par Vercel


build/web


## 🔹 Domaine final
https://qrpruf.sanadidari.com  
(CNAME → Vercel)

---

# 🤖 Système d’Agents GPT — PRO MODE

Ce projet est optimisé pour être maintenu par **des agents GPT professionnels**.  
Les règles complètes se trouvent dans `/docs`.

## 🔹 Règles fondamentales
- Toujours travailler en **PRO MODE**
- Jamais d’invention
- Toujours lire `/docs` + dépôt GitHub avant toute action
- Une seule action à la fois : proposer → valider → exécuter → documenter
- Mise à jour obligatoire de :
  - `STATE_PROJECT.md`
  - `TASKS.md`

## 🔹 Fichiers cruciaux pour les agents


docs/AGENT_START.md
docs/AGENT_STARTUP_CHECKLIST.md
docs/NEXT_ACTION.md
docs/STATE_PROJECT.md
docs/RULES.md
docs/ARCHITECTURE.md
docs/HISTORY.md
docs/DEPLOY_GUIDE_VERCEL.md
docs/TASKS.md
docs/CHECKLIST_MASTER.md


---

# 📚 Documentation PRO

Toute la documentation du projet se trouve dans le dossier :

➡️ **/docs**  

Elle couvre :

- Règle d’Or  
- Processus agents GPT  
- Architecture Flutter/Vercel  
- Guide de déploiement  
- Roadmap & tâches  
- Historique complet  

---

# 🛠️ Développeur — Commandes utiles

## 🔹 Installation Flutter Web


flutter config --enable-web
flutter doctor


## 🔹 Build


flutter build web --release


## 🔹 Déploiement (automatique)


git add .
git commit -m "update"
git push origin main


---

# 📞 Assistance & Contact
Ce projet est maintenu dans le cadre de **Sanad Idari**.  
Pour toute assistance technique, veuillez utiliser la section Issues du dépôt GitHub ou contacter l’administrateur.

---

# ✔️ FIN DU FICHIER
Version : 1.0 — Enterprise PRO
