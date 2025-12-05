## TASKS.md — MISSION TASK MATRIX (MTM-2)
Projet : empreinte_verif
Classification : OPÉRATIONNEL — STRICT — ZERO-ERROR

----------------------------------------------------------------------
1. TERMINÉ — Missions accomplies

INFRASTRUCTURE & DNS
  - Migration HostPapa → Vercel
  - Configuration DNS complète
  - Activation SSL
  - Routage SPA corrigé

FLUTTER & UI
  - Build Flutter Web validé
  - Page blanche corrigée
  - Responsive testé et validé

DOCUMENTATION
  - Création du dossier /docs
  - Passage complet en PRO MODE
  - Documentation militaire réécrite

CI/CD & SÉCURITÉ
  - Installation build_web.yml
  - Installation mirror.yml
  - Création MIRROR_DEPLOY_KEY
  - Création VERCEL_TOKEN
  - Miroir public opérationnel

----------------------------------------------------------------------
2. EN COURS — Missions actives

DÉPLOIEMENT AUTOMATIQUE FLUTTER WEB → VERCEL  
Cette mission correspond EXACTEMENT à la NEXT ACTION militaire.

Actions militaires :
  - vérifier CI/CD (build_web.yml)
  - vérifier déploiement Vercel
  - analyser logs de build
  - tester domaine final
  - mettre à jour documentation

Une seule action peut avancer à la fois.

----------------------------------------------------------------------
3. À FAIRE — Missions programmées

API BACKEND — PHASE 2
  - créer endpoint /scan
  - recevoir empreinte base64
  - renvoyer réponse JSON
  - sécuriser via token

INTÉGRATION API FLUTTER — PHASE 3
  - appel HTTP depuis Flutter
  - affichage résultat
  - gestion erreurs

DÉVELOPPEMENT MOBILE — PHASE 4
  - permissions biométriques Android
  - test hardware fingerprint
  - UI mobile dédiée

OPTIMISATIONS — PHASE 5
  - sécurité
  - performance
  - compression assets
  - SEO Web
  - logs système

INFRASTRUCTURE OPTIONNELLE
  - versioning releases
  - mode maintenance
  - rollback automatique
  - notifications Discord

----------------------------------------------------------------------
4. BLOQUÉ — Missions en attente

Aucune mission bloquée actuellement.

Si un agent détecte :
  - clé manquante
  - workflow cassé
  - repo inaccessible
  → il doit ajouter la mission ici immédiatement.

----------------------------------------------------------------------
5. RÈGLES STRICTES DE MISE À JOUR

Toute mise à jour doit être accompagnée d’une mise à jour de :
  - STATE_PROJECT.md
  - HISTORY.md (optionnel)

Commandes officielles :
  git add .
  git commit -m "update tasks: <description>"
  git push

Interdit :
  - inventer une tâche
  - marquer une tâche terminée sans succès réel
  - ignorer la NEXT ACTION militaire

----------------------------------------------------------------------
FIN DU FICHIER — TASKS.md v2.0 (FORMAT 80 COLONNES)
