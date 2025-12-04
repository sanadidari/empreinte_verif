# TASKS.md — Suivi des Tâches du Projet (PRO MODE)

## 🔵 TÂCHES TERMINÉES

### 🟦 Infrastructure & Déploiement
- Migration complète de HostPapa → Vercel
- Mise en place du DNS Vercel moderne (`vercel-dns-017.com`)
- Configuration CNAME pour :
  - `qrpruf.sanadidari.com`
  - `www.qrpruf.sanadidari.com`
- Propagation DNS vérifiée mondialement (dnschecker)
- Activation du domaine dans Vercel (Settings → Domains)
- Génération automatique SSL (Let's Encrypt)
- Correction du problème de certificat (NET::ERR_CERT_COMMON_NAME_INVALID)

### 🟦 GitHub Actions (CI/CD)
- Création du workflow `.github/workflows/build_web.yml`
- Intégration complète Flutter Web → Vercel deploy
- Vérification du token sécurisé `VERCEL_TOKEN`
- Build automatisé + déploiement en production

### 🟦 Configuration du Projet
- Création du fichier `vercel.json` (routing Flutter SPA)
- Correction de la première version (wildcard incorrect)
- Mise en place du routing final vers `/index.html`

### 🟦 Documentation / Organisation
- Mise en place du dossier `/docs`
- Création du document PRO `VERCEL_DEPLOY.md`
- Ajout de la Règle d’Or PRO MODE
- Mise à jour du système interne de gestion agents GPT

---

## 🟡 TÂCHES EN COURS
- Vérification du certificat SSL (en attente de validation complète)
- Vérification que la dernière version du site Flutter Web s'affiche sur :  
  - https://qrpruf.sanadidari.com
  - https://www.qrpruf.sanadidari.com

---

## 🔴 TÂCHES À FAIRE (PROCHAINES ACTIONS)
- Mettre à jour `STATE_PROJECT.md` avec l’état final du déploiement
- Mettre à jour `HISTORY.md` avec toutes les étapes de migration
- Vérifier le premier rendu public du site Flutter Web
- Valider la conformité du projet avec AGENT_START.md
- Ajouter redirection automatique `www → root` (optionnel)

---

## ⚫ TÂCHES BLOQUÉES
- Aucune tâche bloquée actuellement

---

## 🟣 IDÉES / AMÉLIORATIONS FUTURES
- Optimisation SEO Flutter Web
- Mise en place d’un système de Monitoring Vercel
- Amélioration du CI/CD (cache Flutter, build incremental)
- Automatisation du versioning et changelog
- Ajout d’un preview staging (avant production)
- Intégration de tests automatiques Flutter Web
