# SANAD IDARI / QRPRUF — Project State File (Enhanced PRO Edition)
## Version 1.2 — Maintained by GPT-SANAD PRO
**Last updated:** 2025-12-02 23:59 +01

============================================================
[1] IDENTITÉ DU PROJET
============================================================
project_name      : empreinte_verif
company_name      : Sanad Idari Sarl
package_name      : com.sanadidari.empreinte
description       : Application de vérification biométrique (fingerprint + futur facial)
platforms         : Android, Web
deployment_root   : https://sanadidari.com/testftp/

============================================================
[2] RÈGLES D'OR (PRO MODE — OBLIGATOIRES POUR TOUS LES GPT)
============================================================
1 — Le modèle doit travailler en mode PRO : rapide, propre, structuré.
2 — Fournir toujours les fichiers COMPLETS lors d’une modification.
3 — Toujours maintenir la cohérence entre les sessions.
4 — Toujours générer le fichier complet modifié (pas de patch).
5 — Toujours travailler étape par étape avec checklist.
6 — Documenter chaque action dans ce state.
7 — Assurer la continuité technique entre modèles GPT.
8 — Vérifier la cohérence Android/Web avant déploiement.
9 — Le modèle doit proposer des améliorations continues.
10 — Le modèle doit suivre une passation stricte à chaque fin de session.
11 — Samir doit toujours fournir la dernière version du state au début.
12 — À chaque nouvelle session GPT, le modèle doit demander et charger ce state AVANT toute réponse.
13 — Gestion avancée du cache Flutter Web :
    - Ajouter un cache‑buster dans index.html,
    - Proposer no-cache dans .htaccess,
    - Vérifier les versions de main.dart.js,
    - Empêcher les utilisateurs de voir une version obsolète.
14 — Passation technique obligatoire :
    - Résumer état, risques, dépendances,
    - Fournir les fichiers modifiés,
    - Indiquer la prochaine étape.
15 — Deployment Rules :
    - Confirmer sauvegarde des fichiers sources,
    - Lancer flutter clean / pub get / build web,
    - Vérifier présence setup.html & APK,
    - Forcer overwrite du main.dart.js.
16 — Debug Rules :
    - Diagnostiquer .htaccess parents,
    - Vérifier MIME-Type,
    - Détecter mod_security,
    - Détecter problèmes cache navigateur,
    - Détecter redirections non désirées.
17 — Client Experience Rules :
    - Fournir fallback propre en cas d’erreur,
    - Proposer error.html si APK introuvable,
    - Jamais laisser un utilisateur bloqué par une erreur Chrome.
18 — Respect strict du state : aucune action Flutter n’est autorisée tant que le state n’est pas chargé.
19 — Le modèle ne doit jamais inventer de fichiers et doit demander les fichiers manquants.
20 — Le modèle doit valider chaque action Flutter avec un résumé clair.

============================================================
[3] STRUCTURE CODE ACTUELLE
============================================================
(Section maintenue…)

============================================================
[4] CONFIGURATION ANDROID — SIGNATURE & BUILD
============================================================
(Section maintenue…)

============================================================
[5] CONFIG BIOMÉTRIE — local_auth
============================================================
(Section maintenue…)

============================================================
[6] INSTALLATION WEB / APK — DOMAINES & URLS
============================================================
install_page     : /testftp/setup/setup.html
apk_location     : /testftp/apk/app-release.apk

============================================================
[7] OBJECTIFS FONCTIONNELS (ROADMAP)
============================================================
(Section maintenue…)

============================================================
[8] TODO LIST PRIORITAIRE (PRO MODE)
============================================================
[CRITIQUE] Configuration cache-buster Flutter Web — TODO
[CRITIQUE] Amélioration .htaccess no-cache — TODO
[IMPORTANT] Ajout fallback APK error.html — TODO
[IMPORTANT] Vérification mod_security automatique — TODO

============================================================
[9] HISTORIQUE DES ACTIONS (LOG)
============================================================
2025-12-02 — Ajout des règles 18 → 20 (respect state, vrais fichiers, résumés d’actions).
2025-12-02 — Ajout des règles d’or 12 → 17 (cache, sécurité, debug, UX).
2025-12-02 — Résolution problème install.html → setup.html + mod_security contourné.

============================================================
FIN DU FICHIER — À GARDER À JOUR
============================================================
