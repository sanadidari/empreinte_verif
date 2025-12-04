# 🌐 Empreinte Vérif — Sanad Idari  
## Flutter Web • CI/CD GitHub • Déploiement Vercel • Documentation PRO

---

## 🚀 Introduction  
**Empreinte Vérif** est une application Flutter Web intégrée dans l’écosystème *Sanad Idari*.  
Le projet inclut :

- Une interface web Flutter optimisée  
- Un pipeline CI/CD GitHub Actions  
- Un déploiement automatique vers Vercel  
- Un domaine personnalisé : `qrpruf.sanadidari.com`  
- Une documentation complète pour agents & développeurs  

L’objectif : disposer d’un système robuste, automatisé et parfaitement documenté.

---

## 🛠 Technologie

| Technologie | Rôle |
|------------|------|
| **Flutter Web** | Frontend Web |
| **Vercel** | Hébergement & CDN |
| **GitHub Actions** | CI/CD automatisé |
| **HostPapa** | Gestion du DNS (uniquement CNAME) |

---

## 📂 Architecture du projet
empreinte_verif/
├── lib/
├── web/
├── build/ (généré automatiquement)
├── docs/ (documentation PRO)
│ ├── AGENT_START.md
│ ├── TASKS.md
│ ├── STATE_PROJECT.md
│ ├── VERCEL_DEPLOY.md ← nouveau
│ └── ...
├── .github/
│ └── workflows/
│ └── build_web.yml
├── vercel.json
├── pubspec.yaml
└── README.md


---

## ⚙️ CI/CD — Déploiement Automatique

Chaque push sur la branche `main` déclenche automatiquement :

1. Installation de Flutter  
2. Nettoyage + `pub get`  
3. Build Flutter Web (`flutter build web`)  
4. Déploiement automatique sur **Vercel Production**  

### 🔧 Fichier : `.github/workflows/build_web.yml`  
Voir le workflow complet ici :  
➡️ `/github/workflows/build_web.yml`

---

## 🌍 Domaine & DNS

Le domaine utilisé pour la WebApp :

### **✔ https://qrpruf.sanadidari.com**

DNS configurés dans HostPapa :



qrpruf.sanadidari.com → CNAME → 9a0a2fdeff44fe9e.vercel-dns-017.com
www.qrpruf.sanadidari.com
 → CNAME → qrpruf.sanadidari.com


Vercel émet ensuite automatiquement :

- Le certificat SSL  
- La redirection `www → root`  
- Le routage SPA (via vercel.json)  

---

## 🧭 Routage Flutter (vercel.json)

Pour que toutes les routes Flutter soient gérées correctement :

```json
{
  "version": 2,
  "routes": [
    { "src": "/(.*)", "dest": "/index.html" }
  ]
}


Évite le 404 sur navigation interne.

📚 Documentation complète

Toute la documentation est disponible dans le dossier /docs.

🔗 Documents principaux :
Document	Rôle
VERCEL_DEPLOY.md	Déploiement complet Vercel + DNS
STATE_PROJECT.md	État du projet
TASKS.md	Tâches réalisées / à faire
HISTORY.md	Historique complet
AGENT_START.md	Instructions pour nouveaux agents
ARCHITECTURE.md	Architecture complète du projet

Documentation centrale
➡️ /docs/VERCEL_DEPLOY.md

🧪 Tester en local
flutter clean
flutter pub get
flutter run -d chrome

🚀 Build manuel (si besoin)
flutter build web --release


Les fichiers sont générés dans :
➡️ build/web/

👥 Agents & Collaboration

Le projet suit un protocole strict :

PRO MODE

Documentation obligatoire

Mise à jour du state après chaque tâche

Un seul changement validé à la fois

Fichiers complets lors de chaque modification

Lecture obligatoire des fichiers dans /docs

Règles complètes :
➡️ /docs/RULES.md

🛡 Maintenance & Monitoring

Logs Vercel :
https://vercel.com/sanad-idari/empreinte-verif

Logs GitHub Actions :
https://github.com/sanadidari/empreinte_verif/actions

🏁 Résumé

Ce projet est désormais :

✔ Automatisé
✔ Sécurisé
✔ Documenté
✔ Déployé
✔ Professionnel

Grâce à la combinaison Flutter + Vercel + GitHub Actions + DNS propre.

🧑‍💻 Auteur & Gestion

Sanad Idari
Gestion assistée par Agent PRO (ChatGPT)
