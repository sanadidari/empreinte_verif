## AGENT_START.md — QUICK START MILITAIRE (QS-1)
Projet : empreinte_verif
Classification : STRICT — ZÉRO-ERREUR — PRO MODE

Ce document explique comment un agent GPT doit démarrer immédiatement
sur le projet. C’est une vue rapide, simplifiée et militaire qui mène
ensuite vers AGENT_PROTOCOL.md pour la procédure complète.

----------------------------------------------------------------------
1. OBJECTIF DU QUICK START

Fournir à l’agent :
  - la vue d’ensemble
  - les premières étapes obligatoires
  - le point d’entrée vers les docs militaires
  - la confirmation de la source de vérité

----------------------------------------------------------------------
2. SOURCE DE VÉRITÉ OFFICIELLE

Le code et la documentation DOIVENT être lus uniquement depuis :

➡️ Repo miroir public (source unique)
https://github.com/sanadidari/empreinte_verif_mirror

Le repo privé ne sert qu’à :
  - lancer CI/CD
  - exécuter workflows
  - déployer sur Vercel

L’agent ne lit jamais le repo privé en premier.

----------------------------------------------------------------------
3. ÉTAPES DE DÉMARRAGE RAPIDE (VERSION COURTE)

1️⃣ Lire ce fichier (AGENT_START.md)  
2️⃣ Lire AGENT_PROTOCOL.md  
3️⃣ Lire STARTUP_CHECKLIST.md  
4️⃣ Effectuer les SCANS obligatoires  
5️⃣ Produire le RAPPORT INITIAL  
6️⃣ STOP — attendre validation utilisateur  

----------------------------------------------------------------------
4. ÉTAPES DE DÉMARRAGE DÉTAILLÉES

4.1 Lire les documents dans cet ordre :
  1. AGENT_START.md (ce fichier)
  2. AGENT_PROTOCOL.md
  3. STARTUP_CHECKLIST.md
  4. NEXT_ACTION.md
  5. STATE_PROJECT.md
  6. RULES.md
  7. ARCHITECTURE.md
  8. HISTORY.md
  9. DEPLOY_GUIDE.md
  10. TASKS.md
  11. CHECKLIST_MASTER.md (si présent)

4.2 Vérifier accès :
  - repo miroir public → DOIT fonctionner
  - repo privé → utilisé uniquement pour pipeline

4.3 Exécuter les 6 SCANS obligatoires :
  - accès repos
  - lecture docs
  - cohérence commits
  - workflows présents
  - secrets
  - NEXT_ACTION

4.4 Produire le RAPPORT INITIAL strict.

----------------------------------------------------------------------
5. FORMAT DU RAPPORT INITIAL (OBLIGATOIRE)

```text
[PROTOCOL INITIAL REPORT – LEVEL RED]

1. Private repo access: OK/NON
2. Mirror repo access: OK/NON
3. Docs loaded: <liste>
4. Last commit (private): <hash>
5. Last commit (mirror): <hash>
6. Sync status: SYNC / OUTDATED
7. NEXT ACTION: <copie exacte>

QUESTION: Souhaites-tu valider l’exécution de l’étape 1 ?
```

Après ce rapport, l’agent doit STOP.

----------------------------------------------------------------------
6. RÈGLES RAPIDES POUR TOUS LES AGENTS

✔ Une seule action par étape  
✔ Toujours demander validation  
✔ Fournir fichiers complets  
✔ Proposer commandes git  
✔ Ne jamais modifier build/web  
✔ Ne jamais inventer une action  
✔ Suivre strictement NEXT_ACTION  

----------------------------------------------------------------------
7. ERREURS CRITIQUES À ÉVITER

❌ commencer par répondre sans SCANS  
❌ ignorer le miroir public  
❌ sauter NEXT_ACTION  
❌ proposer plusieurs actions  
❌ produire un résumé inventé  
❌ modifier des workflows sans accord  
❌ oublier mise à jour des docs  

----------------------------------------------------------------------
8. PASSERELLE VERS LE PROTOCOLE COMPLET

Après lecture de ce fichier, l’agent doit ouvrir :

➡️ **AGENT_PROTOCOL.md**  
C’est le cœur du système militaire.

----------------------------------------------------------------------
FIN DU FICHIER — AGENT_START.md v1.0 (FORMAT 80 COLONNES)
