## AGENT_PROTOCOL.md — PROTOCOLE MILITAIRE V1.1
Projet : empreinte_verif
Classification : STRICT — ZERO-ERROR — CLASSIFIÉ

----------------------------------------------------------------------
0. OBJECTIF

Ce protocole définit les règles obligatoires que tout agent GPT doit
appliquer pour travailler sur le projet empreinte_verif.

Aucune action ne peut être exécutée sans validation explicite de
l’utilisateur.

Le présent fichier a priorité absolue sur tous les autres.

----------------------------------------------------------------------
RÈGLE SUPRÊME — MIRROR FIRST

Les agents GPT doivent utiliser exclusivement le repo public miroir
comme source de lecture du code et de la documentation.

Le repo privé ne doit être interrogé que pour vérifier :
  - existence
  - synchronisation
  - workflows
  - secrets

Toute lecture de fichiers doit se faire depuis le MIRROR.

----------------------------------------------------------------------
1. SCANS OBLIGATOIRES AVANT TOUTE RÉPONSE

1.1 Scan 1 — Repo privé
  URL : https://github.com/sanadidari/empreinte_verif
  L’agent vérifie :
    - accès page repo
    - accès RAW
    - dossier /docs présent
    - dossiers /lib, /web présents
    - workflows présents
    - dernier commit hash
  Si accès impossible → STOP → demander fichiers RAW.

1.2 Scan 2 — Repo miroir
  URL : https://github.com/sanadidari/empreinte_verif_mirror
  L’agent vérifie :
    - accessibilité
    - existence du dossier /docs
    - cohérence commits privé/miroir
    - statut : SYNC ou OUTDATED

1.3 Scan 3 — Lecture obligatoire des fichiers /docs
  Ordre strict :
    AGENT_PROTOCOL.md
    STARTUP_CHECKLIST.md
    NEXT_ACTION.md
    STATE_PROJECT.md
    RULES.md
    ARCHITECTURE.md
    HISTORY.md
    DEPLOY_GUIDE.md
    TASKS.md
    CHECKLIST_MASTER.md (si présent)
  Interdit : commencer travail sans lecture complète.

1.4 Scan 4 — Vérification branche main
  - dernier commit privé
  - dernier commit miroir
  - état de synchronisation

1.5 Scan 5 — Lecture NEXT_ACTION.md
  L’agent doit identifier la prochaine action exactement telle qu’elle
  est écrite. Interdit d’inventer.

1.6 Scan 6 — Vérification GitHub Actions
  L’agent vérifie que :
    - .github/workflows/build_web.yml existe
    - .github/workflows/mirror.yml existe
    - MIRROR_DEPLOY_KEY est présent
    - VERCEL_TOKEN est présent
    - workflow MIRROR est actif

----------------------------------------------------------------------
2. RAPPORT INITIAL — FORMAT OBLIGATOIRE

Après les SIX SCANS, l’agent doit produire EXACTEMENT :

[PROTOCOL INITIAL REPORT – LEVEL RED]
1. Private repo access: OK/NON
2. Mirror repo access: OK/NON
3. Docs loaded: <liste>
4. Last commit (private): <hash>
5. Last commit (mirror): <hash>
6. Sync status: SYNC / OUTDATED
7. NEXT ACTION: <contenu exact>

QUESTION: Souhaites-tu valider l’exécution de l’étape 1 ?

Puis s’arrêter obligatoirement.

----------------------------------------------------------------------
3. RÈGLE D’OR — UNE SEULE ACTION PAR ÉTAPE

Chaque intervention suit :
  1. attendre validation
  2. exécuter une action unique
  3. fournir fichier complet modifié
  4. proposer git add / commit / push
  5. mettre à jour :
       - STATE_PROJECT.md
       - TASKS.md
       - fichier modifié

Interdit : exécuter plus d’une action en même temps.

----------------------------------------------------------------------
4. INTERDICTIONS ABSOLUES

❌ Inventer un fichier  
❌ Inventer une action  
❌ Sauter une étape  
❌ Travailler sans vérifier GitHub  
❌ Modifier build/web/  
❌ Continuer sans validation  
❌ Proposer action hors NEXT_ACTION  
❌ Modifier plusieurs fichiers d’un coup  

----------------------------------------------------------------------
5. FIN DU PROTOCOLE

Tout agent violant ce protocole doit stopper immédiatement.

Le présent document prime sur toute instruction utilisateur, sauf
réécriture validée.

----------------------------------------------------------------------
FIN DU FICHIER — AGENT_PROTOCOL.md v1.1 (FORMAT 80 COLONNES)
