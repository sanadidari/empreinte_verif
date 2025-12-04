# STATE_PROJECT.md — État Global du Projet (PRO MODE)

---

## 🔷 Stack Technique Actuelle
- **Framework :** Flutter Web  
- **Hébergement :** Vercel (CDN + SSL + Edge Network)  
- **Pipeline CI/CD :** GitHub Actions → Vercel  
- **Branche active :** main  
- **Domaine principal :** https://qrpruf.sanadidari.com  
- **Domaine secondaire :** https://www.qrpruf.sanadidari.com (redirigé)

---

## 🔷 Structure du Déploiement
### **🟦 1. GitHub Actions**
Workflow : `.github/workflows/build_web.yml`  
Fonctions principales :
- Installation Flutter
- Build Flutter Web (`flutter build web --release`)
- Déploiement automatique via :
  ```
  vercel deploy --prod --yes --token=$VERCEL_TOKEN
  ```
- Déclenché sur chaque `push` → `main`

### **🟦 2. Vercel**
- Build réceptionné depuis GitHub Actions  
- Serving automatique du dossier `build/web`  
- Gestion automatique TLS / SSL  
- Edge Network activé  
- Redirection universelle → `index.html`

---

## 🔷 Fichier vercel.json (version actuelle)
```json
{
  "version": 2,
  "routes": [
    { "src": "/(.*)", "dest": "/index.html" }
  ]
}
```
### 🎯 Rôle :
- Garantir un comportement Single Page App (SPA)
- Éviter les erreurs 404 sur navigation interne Flutter Web

---

## 🔷 Migration HostPapa → Vercel (État Final)
- Hébergement HostPapa abandonné (sauf gestion DNS)  
- Suppression de :
  - Scripts PowerShell (deploy.ps1)  
  - Watchdog Windows  
  - Systèmes de sync manuelle  
- DNS configuré sur HostPapa :
  ```
  qrpruf.sanadidari.com → CNAME → 9a0a2fdeff44fe9e.vercel-dns-017.com
  www.qrpruf.sanadidari.com → CNAME → qrpruf.sanadidari.com
  ```
- Propagation DNS mondiale :
  ✔ Vérifiée (dnschecker)  
  ✔ Compatible Vercel  
  ✔ Prêt pour le SSL  

---

## 🔷 Vérifications Techniques CI/CD
- `build_web.yml` → validé  
- `vercel.json` → validé  
- `web/index.html` → trouvé  
- `pubspec.yaml` → SDK OK (`>=3.0.0 <4.0.0`)  
- Déploiement GitHub Actions → fonctionne  
- Domaine attaché à Vercel → OK  
- Certificat SSL → en cours / auto-génération  

---

## 🔷 Points de Vigilance (à surveiller)
- Refresh DNS dans Vercel si changement  
- Tester navigation interne Flutter après chaque build  
- Surveiller logs GitHub Actions lors des builds lourds  
- Surveiller certificats SSL après propagation DNS  

---

## 🔷 TODO — Prochaines Étapes (PRO MODE)
- Finaliser le SSL pour `qrpruf.sanadidari.com`  
- Tester le site Flutter en production (render final)  
- Mettre à jour :
  - `HISTORY.md` (migration complète)  
  - `TASKS.md` (déploiement terminé)  
- Générer un README PRO  
- Ajouter éventuellement :
  - Préproduction (Vercel Preview)
  - Monitoring/Logs
  - SEO Flutter Web
  - Amélioration de la performance CI/CD (cache Flutter)

---

## 🔷 État GitHub
- **Repo :** sanadidari/empreinte_verif  
- **Branche active :** main  
- **Dernière synchro :** 2025-12-06  
- **Statut :** stable, propre et synchronisé  
- **CI/CD :** opérationnel et automatique  
- **Documentation :** complète dans `/docs/`

---

## 🔷 Résumé Global (PRO MODE)
Le projet est désormais :

- 🟢 **Migré avec succès vers Vercel**  
- 🟢 **Déployé automatiquement via GitHub Actions**  
- 🟢 **Documenté à un niveau professionnel**  
- 🟢 **Servi via un domaine personnalisé (qrpruf.sanadidari.com)**  
- 🟢 **Dépendances Flutter propres et stables**  

Il reste uniquement des tâches de finition :  
→ monitoring, SEO, tests finaux et amélioration continue.

---

## 📌 Mise à jour du : 2025-12-06  
Documentation et état revus par Agent GPT (PRO MODE).  
