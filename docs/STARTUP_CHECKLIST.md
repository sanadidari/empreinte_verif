## STARTUP_CHECKLIST.md — STARTUP PROTOCOL V1.1
Projet : empreinte_verif
Classification : STRICT — MILITARY MODE — ZERO-ERROR

----------------------------------------------------------------------
OBJECTIF

Cette checklist définit les étapes obligatoires qu’un agent GPT doit
exécuter AVANT toute analyse ou réponse.

Aucune étape ne peut être sautée.  
Aucune réponse ne peut être produite avant validation complète.

Cette checklist complète AGENT_PROTOCOL.md.

----------------------------------------------------------------------
1. VÉRIFICATION ACCÈS GITHUB

1.1 Repo privé
  URL : https://github.com/sanadidari/empreinte_verif
  Vérifier :
    - accès page repo
    - accès RAW
    - /docs présent
    - /lib présent
    - /web présent
    - workflows présents
    - dernier commit hash
  Si accès impossible → STOP → demander fichiers RAW.

1.2 Repo miroir (SOURCE UNIQUE)
  URL : https://github.com/sanadidari/empreinte_verif_mirror
  Vérifier :
    - accessibilité
    - cohérence commits
    - dernier commit
    - statut : SYNC / OUTDATED

----------------------------------------------------------------------
2. LECTURE OBLIGATOIRE DES FICHIERS DOCS

Lire dans cet ordre strict :
  1. AGENT_PROTOCOL.md
  2. STARTUP_CHECKLIST.md (ce fichier)
  3. NEXT_ACTION.md
  4. STATE_PROJECT.md
  5. RULES.md
  6. ARCHITECTURE.md
  7. HISTORY.md
  8. DEPLOY_GUIDE.md
  9. TASKS.md
  10. CHECKLIST_MASTER.md (si présent)

Aucun travail ne peut commencer avant lecture complète.

----------------------------------------------------------------------
3. VÉRIFICATION STRUCTURE DU PROJET

Vérifier :
  - pubspec.yaml présent
  - lib/ non vide
  - web/ contient index.html + assets
  - build/web ignoré
  - android/ et ios/ présents
  - workflows :
      build_web.yml
      mirror.yml

----------------------------------------------------------------------
4. VÉRIFICATION DES SECRETS GITHUB ACTIONS

Secrets obligatoires :
  - MIRROR_DEPLOY_KEY
  - VERCEL_TOKEN

L’agent doit signaler :
  - clé manquante
  - clé invalide
  - clé mal nommée

----------------------------------------------------------------------
5. VÉRIFICATION PIPELINE GITHUB ACTIONS

Build pipeline (build_web.yml) :
  - flutter build web --release
  - output : build/web
  - runner : ubuntu-latest

Mirror pipeline (mirror.yml) :
  - clé SSH détectée
  - known_hosts présent
  - remote miroir correct

Si erreur détectée → STOP → demander validation.

----------------------------------------------------------------------
6. ANALYSE NEXT_ACTION.md

L'agent doit :
  - extraire LA prochaine action
  - s’y conformer strictement

Interdit :
  - inventer une étape
  - proposer action non écrite

----------------------------------------------------------------------
7. RAPPORT INITIAL — FORMAT OBLIGATOIRE

Après exécution des SCANS, fournir EXACTEMENT :

[STARTUP CHECK COMPLETE]
1. Repo privé: OK/NON
2. Repo miroir: OK/NON
3. Docs chargés: <liste>
4. Dernier commit privé: <hash>
5. Dernier commit miroir: <hash>
6. Sync status: SYNC / OUTDATED
7. NEXT ACTION: <copie exacte>

Souhaites-tu valider l'étape 1 ?

Puis STOP.

----------------------------------------------------------------------
FIN DU FICHIER — STARTUP_CHECKLIST.md v1.1 (FORMAT 80 COLONNES)
