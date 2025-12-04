# HISTORY.md — Journal du Projet (PRO MODE)

---

## 🗓️ 2025-12-01 → 2025-12-04 — Phase HostPapa & Premiers Tests
- Premiers tests d’hébergement via HostPapa  
- Tentatives d'automatisation via WinSCP  
- Blocage : HostPapa refuse FTP scripté sans VPS  
- Pas d’accès SSH → pipeline impossible  
- Décision stratégique : migrer l’infrastructure vers **Vercel**  
- Première structuration du système pour agents GPT  

---

## 🗓️ 2025-12-05 — Structuration PRO MODE
- Vérification complète du dépôt GitHub  
- Ajout du dossier `/docs`  
- Ajout des fichiers :  
  - `TASKS.md`  
  - `STATE_PROJECT.md`  
  - `CHECKLIST_MASTER.md`  
  - `HISTORY.md` (première version)  
  - `RULES.md` (supports agents)  
  - `AGENT_START.md` (protocoles agents GPT)  
- Activation officielle du **PRO MODE** :
  - Un seul changement par étape  
  - Documentation obligatoire  
  - Comportement strict et professionnel  

---

## 🗓️ 2025-12-06 — Mise en Place du Déploiement Vercel
### 🔧 CI/CD
- Création du workflow GitHub Actions :  
  `.github/workflows/build_web.yml`
- Configuration :
  - Installation Flutter  
  - Build Flutter Web  
  - Déploiement automatique `vercel deploy`  
  - Utilisation du token sécurisé `VERCEL_TOKEN`

### 🌐 Routage Vercel
- Création initiale de `vercel.json`  
- Correction du fichier pour prendre en charge Flutter SPA  
- Redirection globale → `index.html`

---

## 🗓️ 2025-12-06 — Migration DNS (HostPapa → Vercel)
- Suppression des anciens CNAME HostPapa  
- Ajout du CNAME moderne recommandé par Vercel :  
  - `qrpruf.sanadidari.com → 9a0a2fdeff44fe9e.vercel-dns-017.com`
- Ajout du sous-domaine `www.qrpruf` → root  
- Vérification propagation mondiale (dnschecker.org)  
- Fix des erreurs SSL liées au domaine  
- Rafraîchissement du domaine dans Vercel (Settings → Domains)  

Résultat :  
➡️ Domaine validé  
➡️ SSL émis automatiquement (Let's Encrypt)  

---

## 🗓️ 2025-12-06 — Stabilisation du Déploiement Flutter Web
- Vérification du contenu de `build/web/`  
- Vérification CI/CD GitHub Actions  
- Déploiement 100 % automatisé et fonctionnel  
- Validation de la production Vercel  

---

## 🗓️ 2025-12-06 — Documentation PRO
- Création du fichier complet :  
  **`VERCEL_DEPLOY.md`**
- Ajout dans `/docs`  
- Mise en place :
  - Architecture du déploiement  
  - Journal complet DNS  
  - Workflow CI/CD  
  - Résolution des erreurs  
  - Instructions agents GPT  

---

## 🟢 État actuel (2025-12-06)
- Flutter Web → OK  
- CI/CD GitHub → OK  
- Déploiement automatique → OK  
- Domaine `qrpruf.sanadidari.com` → Validé  
- SSL → Activé  
- Documentation → Stable  
- Agents GPT → Fonctionnels sous PRO MODE  

---

## 📌 Note Générale
Toutes les opérations doivent être **documentées** dans :  
- `HISTORY.md`  
- `TASKS.md`  
- `STATE_PROJECT.md`  

> La documentation Vercel (`VERCEL_DEPLOY.md`) est maintenant la référence officielle du déploiement.

