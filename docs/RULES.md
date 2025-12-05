## RULES.md — MILITARY OPERATING RULES (MOR-2)
Projet : empreinte_verif
Classification : STRICT — ZERO-ERROR — NON-NÉGOCIABLE

----------------------------------------------------------------------
1. RÈGLE D’OR — PRO MODE STRICT

Un agent GPT travaillant sur ce projet doit :
  - répondre avec précision et concision
  - appliquer les procédures militaires
  - utiliser exclusivement :
      • les fichiers /docs
      • le repo miroir public (source unique)
      • le repo privé pour vérifications
  - refuser toute supposition
  - refuser toute action non validée
  - s'arrêter après chaque étape

Interdit absolument :
  - inventer
  - deviner sans preuve
  - exécuter plusieurs actions à la fois
  - travailler avant les SCANS
  - sauter NEXT_ACTION
  - modifier build/web/

----------------------------------------------------------------------
2. ACCÈS GITHUB — LOI ABSOLUE

2.1 Repo privé
  L’agent doit vérifier :
    - accessibilité
    - dossiers /lib, /web, /docs
    - workflows GitHub
    - RAW disponibles

2.2 Repo miroir (SOURCE UNIQUE)
  MUST READ = Miroir uniquement.
  Vérifier :
    - accessibilité
    - dernier commit
    - cohérence privé/miroir
    - statut SYNC / OUTDATED

2.3 Si échec d’accès
  L’agent doit obligatoirement demander :
    - rendre /docs public
    - fournir RAW
    - copier/coller contenu
  Aucune autre option n’est autorisée.

----------------------------------------------------------------------
3. RÉGIME DE TRAVAIL — UNE SEULE ACTION PAR ÉTAPE

Chaque séquence suit ce cycle :
  1. proposer action
  2. recevoir validation
  3. exécuter l'action unique
  4. fournir fichier modifié complet
  5. proposer commandes git :
        git add .
        git commit -m "<message>"
        git push
  6. mettre à jour :
        - STATE_PROJECT.md
        - TASKS.md
        - le fichier modifié

STOP obligatoire après l’étape.

----------------------------------------------------------------------
4. LECTURE OBLIGATOIRE DES DOCS

Ordre strict :
  1. AGENT_PROTOCOL.md
  2. STARTUP_CHECKLIST.md
  3. NEXT_ACTION.md
  4. STATE_PROJECT.md
  5. RULES.md (ce fichier)
  6. ARCHITECTURE.md
  7. HISTORY.md
  8. DEPLOY_GUIDE.md
  9. TASKS.md
  10. CHECKLIST_MASTER.md (si présent)

L’agent doit indiquer explicitement les fichiers lus.

----------------------------------------------------------------------
5. VÉRIFICATIONS OBLIGATOIRES

5.1 Structure Flutter
  - pubspec.yaml
  - lib/
  - web/
  - index.html
  - assets
  - scripts Flutter Web

5.2 Infrastructure
  - workflows GitHub présents
  - secrets VERCEL_TOKEN + MIRROR_DEPLOY_KEY
  - vercel.json correct

5.3 Domaine & DNS
  - qrpruf.sanadidari.com
  - CNAME actif
  - SSL actif

----------------------------------------------------------------------
6. INTERDICTIONS ABSOLUES

❌ modifier plusieurs fichiers simultanément  
❌ modifier build/web  
❌ écrire du code inventé  
❌ corriger sans validation  
❌ sauter une étape du protocole  
❌ proposer une action hors NEXT_ACTION  
❌ continuer si un fichier manque  
❌ ignorer le miroir (source unique)

----------------------------------------------------------------------
7. RAPPORT INITIAL — FORMAT OBLIGATOIRE

[PROTOCOL INITIAL REPORT – LEVEL RED]
1. Private repo access: OK/NON
2. Mirror repo access: OK/NON
3. Docs loaded: <liste>
4. Last commit (private): <hash>
5. Last commit (mirror): <hash>
6. Sync status: SYNC / OUTDATED
7. NEXT ACTION: <copie exacte>

QUESTION: Souhaites-tu valider l’exécution de l’étape 1 ?

STOP obligatoire.

----------------------------------------------------------------------
8. CONDITIONS D’ARRÊT

L’agent doit stopper immédiatement si :
  - un fichier /docs manque
  - accès GitHub cassé
  - workflow incorrect
  - secrets manquants
  - incohérence NEXT_ACTION
  - miroir inaccessible

----------------------------------------------------------------------
9. RÈGLE SUPRÊME

La documentation prime sur toutes les demandes utilisateur.
Seule exception : une réécriture validée par l’utilisateur.

----------------------------------------------------------------------
FIN DU FICHIER — RULES.md v2.0 (FORMAT 80 COLONNES)
