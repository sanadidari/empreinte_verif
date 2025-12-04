# AGENT_STARTUP_CHECKLIST.md — Checklist de Démarrage Agent GPT (PRO MODE)

---

## 🔷 1. Lecture obligatoire des documents `/docs`
L’agent doit lire AVANT TOUTE ACTION :

- `RULES.md`  
- `AGENT_START.md`  
- `NEXT_ACTION.md`  
- `STATE_PROJECT.md`  
- `TASKS.md`  
- `HISTORY.md`  
- `ARCHITECTURE.md`  
- `VERCEL_DEPLOY.md`  
- `CHECKLIST_MASTER.md`  

⚠️ Aucun raisonnement ni action technique n’est autorisé avant cette lecture.

---

## 🔷 2. Vérification du dépôt GitHub
L’agent doit :

- Charger le dépôt :  
  `https://github.com/sanadidari/empreinte_verif`
- Lire la branche `main`
- Vérifier la structure Flutter :
  - `lib/`
  - `web/`
  - `pubspec.yaml`
- Vérifier la présence et la validité du CI/CD :
  - `.github/workflows/build_web.yml`
  - `vercel.json`

---

## 🔷 3. Diagnostic initial obligatoire
L’agent doit produire un diagnostic structuré :

### 🔹 1. Résumé du contexte  
### 🔹 2. Résumé de l’état du projet  
### 🔹 3. Prochaine action (tirée de `NEXT_ACTION.md`)  
### 🔹 4. Risques éventuels (DNS, SSL, CI/CD, Flutter Web)  

⚠️ Le diagnostic NE doit contenir AUCUNE action non validée.

---

## 🔷 4. Validation obligatoire
Avant toute modification ou intervention, l’agent doit demander :

> “Souhaites-tu que j’exécute cette action ?”

Sans validation explicite → aucune action autorisée.

---

## 🔷 5. Exécution (PRO MODE)
Si l’utilisateur valide :

- Réaliser **UNE seule action**  
- Fournir **le fichier complet** modifié (jamais partiellement)  
- Exécuter l'action proprement et clairement  
- Résumer la modification en 2 lignes maximum  

---

## 🔷 6. Mise à jour documentaire obligatoire
Après chaque action, l’agent doit mettre à jour :

- `STATE_PROJECT.md`  
- `TASKS.md`  
- `HISTORY.md`  
- `VERCEL_DEPLOY.md` (si déploiement / DNS / CI/CD impacté)  
- `NEXT_ACTION.md` (si l’étape change)  

⚠️ Le système documentaire doit toujours refléter l’état réel du projet.

---

## 🔷 7. Vérification d’accessibilité
L’agent doit vérifier :

- Accessibilité GitHub  
- Accessibilité Vercel  
- Accessibilité du domaine :  
  - `https://qrpruf.sanadidari.com`  
  - `https://www.qrpruf.sanadidari.com`  

En cas d’erreur (404, SSL, DNS), l’agent doit :  
→ Stopper  
→ Diagnostiquer  
→ Proposer une action ciblée

---

## 🔷 8. Fin du démarrage
Quand toutes les étapes ci-dessus sont validées :

➡️ L’agent peut commencer son travail en **PRO MODE**  
en respectant strictement :  
- `RULES.md`  
- `AGENT_START.md`  
- `CHECKLIST_MASTER.md`

---

# 🟩 FIN DU DOCUMENT — AGENT_STARTUP_CHECKLIST.md
