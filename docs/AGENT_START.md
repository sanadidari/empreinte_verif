## AGENT_START.md — MILITARY AUTO-BOOT SEQUENCE v2.0
Projet : empreinte_verif
Classification : STRICT / ZERO-ERROR / TOP-LEVEL

Ce message est OBLIGATOIREMENT utilisé par tout agent GPT comme
INTRODUCTION AUTOMATIQUE lors d’une nouvelle session.  
Il ne doit jamais être modifié sans validation de l’utilisateur.

----------------------------------------------------------------------
🔵 1. OBJECTIF DU MESSAGE

Au lancement d’une session, l’agent doit automatiquement :

1. Charger le repo miroir public :  
   https://github.com/sanadidari/empreinte_verif_mirror

2. Lire la documentation /docs dans l’ordre militaire défini.

3. Exécuter les 6 SCANS du protocole militaire.

4. Générer le RAPPORT INITIAL — LEVEL RED.

5. STOPPER et attendre validation de l’utilisateur pour l’étape 1.

Aucune autre action n’est autorisée avant la validation.

----------------------------------------------------------------------
🔵 2. MESSAGE DE DÉMARRAGE (À AFFICHER AUTOMATIQUEMENT)

### [AGENT BOOT SEQUENCE — ONLINE]

Chargement du miroir public…
Validation accès GitHub…
Analyse dossier /docs…
Lecture séquentielle documentation…
Synchronisation protocole militaire v2.0…
Chargement NEXT_ACTION.md…
Préparation du rapport initial…

Exécution des 6 SCANS obligatoires…

→ SCAN 1 : Accès repo privé  
→ SCAN 2 : Accès repo miroir  
→ SCAN 3 : Lecture docs (ordre strict)  
→ SCAN 4 : État des commits (privé vs miroir)  
→ SCAN 5 : Lecture NEXT_ACTION.md  
→ SCAN 6 : Vérification GitHub Actions (workflows + secrets)

### Génération du rapport final…

----------------------------------------------------------------------
L’agent doit ENSUITE produire EXACTEMENT le message suivant :

[PROTOCOL INITIAL REPORT – LEVEL RED]

1. Private repo access: <OK/NON>  
2. Mirror repo access: <OK/NON>  
3. Docs loaded: <liste>  
4. Last commit (private): <hash>  
5. Last commit (mirror): <hash>  
6. Sync status: SYNC / OUTDATED  
7. NEXT ACTION: <contenu exact depuis NEXT_ACTION.md>

-----------------------------------------------------
QUESTION: Souhaites-tu valider l’exécution de l’étape 1 ?

Et l’agent doit STOPPER complètement.

Aucune action supplémentaire n’est autorisée.
Aucun commentaire n’est autorisé.

----------------------------------------------------------------------
🔵 3. RÈGLES ABSOLUES

- Ce message DOIT être affiché automatiquement au début de chaque session.  
- L’agent ne doit JAMAIS répondre autrement pour démarrer.  
- La logique du protocole militaire prime sur tout.  
- Si une doc manque, si un accès échoue, si un hash diverge,  
  l’agent doit signaler l’anomalie et STOPPER.

----------------------------------------------------------------------
FIN DU FICHIER — AGENT_START.md v2.0
