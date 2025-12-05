## CHECKLIST_MASTER.md — MASTER CONTROL CHECKLIST (MCC-1)
Projet : empreinte_verif
Classification : STRICT — GLOBAL — ZERO-ERROR

Cette checklist regroupe les validations essentielles permettant de
confirmer que le projet est :
  - fonctionnel,
  - synchronisé,
  - sécurisé,
  - conforme au protocole militaire.

----------------------------------------------------------------------
1. VALIDATION GITHUB

[ ] Repo privé accessible  
[ ] Dossiers /lib, /web, /docs présents  
[ ] Workflows présents  
[ ] RAW accessible  
[ ] Dernier commit récupéré  

[ ] Repo miroir accessible  
[ ] Docs présentes dans le miroir  
[ ] Hash miroir ≈ hash privé  
[ ] Statut : SYNC  

----------------------------------------------------------------------
2. VALIDATION DOCUMENTATION

[ ] AGENT_PROTOCOL.md lu  
[ ] STARTUP_CHECKLIST.md lu  
[ ] NEXT_ACTION.md lu  
[ ] STATE_PROJECT.md lu  
[ ] RULES.md lu  
[ ] ARCHITECTURE.md lu  
[ ] HISTORY.md lu  
[ ] DEPLOY_GUIDE.md lu  
[ ] TASKS.md lu  
[ ] CHECKLIST_MASTER.md lu  

Aucune action autorisée sans lecture complète des docs.

----------------------------------------------------------------------
3. VALIDATION SECRETS & SÉCURITÉ

[ ] VERCEL_TOKEN présent  
[ ] MIRROR_DEPLOY_KEY présent  
[ ] Clé SSH non exposée  
[ ] Aucun secret dans le repo  
[ ] Pas de fichier sensible en clair  

----------------------------------------------------------------------
4. VALIDATION CI/CD

Workflow build_web.yml :
  [ ] flutter clean  
  [ ] flutter pub get  
  [ ] flutter build web --release  
  [ ] déploiement Vercel OK  

Workflow mirror.yml :
  [ ] SSH key install  
  [ ] known_hosts configuré  
  [ ] mirror remote correct  
  [ ] push --force fonctionne  

----------------------------------------------------------------------
5. VALIDATION FLUTTER WEB

[ ] lib/ stable  
[ ] web/ complet  
[ ] index.html correct  
[ ] bootstrap OK  
[ ] manifest.json OK  
[ ] icons/ présents  
[ ] assets/ présents  
[ ] build local fonctionne  

----------------------------------------------------------------------
6. VALIDATION VERCEL

[ ] vercel.json présent  
[ ] SPA fallback actif  
[ ] main.dart.js chargé  
[ ] aucune erreur console  
[ ] pas d’assets manquants  

Domaines :
  [ ] qrpruf.sanadidari.com OK  
  [ ] www.qrpruf.sanadidari.com OK  
  [ ] SSL actif  
  [ ] CNAME correct  

----------------------------------------------------------------------
7. VALIDATION NEXT_ACTION

[ ] Prochaine action identifiée  
[ ] Aucun travail hors NEXT_ACTION  
[ ] Étape en cours validée par utilisateur  
[ ] Règle : une seule action à la fois  

----------------------------------------------------------------------
8. VALIDATION MISE À JOUR DES DOCS

Après action exécutée :
  [ ] fichier modifié mis à jour  
  [ ] TASKS.md mis à jour  
  [ ] STATE_PROJECT.md mis à jour  
  [ ] HISTORY.md mis à jour (si nécessaire)  

----------------------------------------------------------------------
9. VALIDATION COMMITS

Commandes obligatoires :
  git add .
  git commit -m "<message clair>"
  git push

[ ] Commit exécuté  
[ ] Miroir auto-synchronisé  
[ ] Déploiement trigger (si applicable)  

----------------------------------------------------------------------
FIN DU FICHIER — CHECKLIST_MASTER.md v1.0 (FORMAT 80 COLONNES)
