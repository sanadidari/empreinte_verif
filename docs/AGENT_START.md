# AGENT_START.md — Protocole de Démarrage pour Agents GPT (PRO MODE)

---

# 🔷 1. LECTURE OBLIGATOIRE DES FICHIERS `/docs`

Avant toute réponse technique, l’agent doit lire attentivement :

- `RULES.md`  
- `AGENT_STARTUP_CHECKLIST.md`  
- `STATE_PROJECT.md`  
- `TASKS.md`  
- `HISTORY.md`  
- `NEXT_ACTION.md`  
- `ARCHITECTURE.md`  
- `VERCEL_DEPLOY.md`  
- `CHECKLIST_MASTER.md`  
- `DEPLOY_GUIDE_VERCEL.md`  

⚠️ **Aucune réponse technique n’est autorisée avant la lecture complète.**

---

# 🔷 2. CHARGER LE RÉPO GITHUB

L’agent doit obligatoirement :

1. Charger le dépôt GitHub :  
   `https://github.com/sanadidari/empreinte_verif`

2. Lire la branche **main**

3. Vérifier :
   - Présence du workflow : `.github/workflows/build_web.yml`
   - Présence et validité de `vercel.json`
   - Structure Flutter :
     - `pubspec.yaml`
     - `lib/`
     - `web/`
   - Fichiers générés (`build/web`, si applicable)

⚠️ Toute anomalie doit être signalée immédiatement avant d’avancer.

---

# 🔷 3. ACTIVER PRO MODE

L’agent doit :

- Toujours écrire proprement, clairement, sans blabla  
- Être précis, structuré, professionnel  
- Ne **rien inventer**  
- Toujours demander validation avant d’agir  
- Réaliser **une seule action technique par étape**  
- Produire les **fichiers complets** et jamais des extraits

---

# 🔷 4. PROCESSUS DE RÉPONSE (Étapes fixes)

### L’agent doit commencer toute intervention par :

1. **Résumé du contexte**  
2. **Résumé de l’état actuel (project + CI/CD + domaine)**  
3. **Identifier la VRAIE prochaine action (depuis NEXT_ACTION.md)**  
4. **Proposer un plan précis pour une seule étape**  
5. **Attendre validation utilisateur**  
6. **Exécuter l’étape validée**  
7. **Mettre à jour la documentation dans `/docs`**  
8. **Retourner un message clair et structuré**

---

# 🔷 5. MISE À JOUR DES DOCUMENTS `/docs`

Après chaque action validée, l’agent doit mettre à jour :

- `STATE_PROJECT.md`  
- `TASKS.md`  
- `HISTORY.md`  
- `VERCEL_DEPLOY.md` (si DNS / Vercel / déploiement)  
- `NEXT_ACTION.md` (si étape avancée)  

⚠️ Le système documentaire doit rester **toujours synchronisé** avec l’état réel du projet.

---

# 🔷 6. RESTRICTIONS IMPORTANTES (FAIL-SAFE)

L’agent ne doit jamais :

- Faire plusieurs modifications en une seule réponse  
- Modifier sans avoir demandé validation  
- Ignorer une erreur détectée  
- Modifier un fichier sans le fournir entièrement  
- Travailler hors PRO MODE  
- Court-circuiter le pipeline CI/CD  
- Modifier DNS ou déploiement sans approbation explicite

---

# 🔷 7. CAS CRITIQUES À SIGNALER IMMÉDIATEMENT

L’agent doit interrompre le flux et demander validation si :

- `pubspec.yaml` incompatible Flutter Web  
- Absence ou erreur dans `.github/workflows/build_web.yml`  
- Erreur dans `vercel.json`  
- Assets Flutter manquants  
- DNS incorrect ou non propagé  
- SSL non émis  
- Build GitHub Actions échoué  
- Problème de routing Flutter Web (404 / page blanche)  
- Conflit Git détecté  

---

# 🔷 8. FIN DU PROTOCOLE

Lorsque tout est chargé, vérifié et validé, l’agent peut commencer son travail **en PRO MODE**, en suivant exactement les règles et la chaîne d’exécution définies ci-dessus.

---

# 🟩 FIN DU DOCUMENT — AGENT_START.md
