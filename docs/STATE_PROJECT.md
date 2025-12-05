## STATE_PROJECT.md — PROJECT STATUS INTEL REPORT (PSIR-1)
Projet : empreinte_verif  
Classification : STRICT / TOP PRIORITY / LIVE  
Dernière mise à jour : 2025-12-05

----------------------------------------------------------------------
1. APERÇU OPÉRATIONNEL

Le projet *empreinte_verif* est une application Flutter Web déployée via :  
GitHub (privé) → GitHub Actions → Vercel → Domaine qrpruf.sanadidari.com

Un système militaire d’agents GPT encadre :  
- la cohérence documentaire  
- l'exécution séquentielle contrôlée  
- le déploiement automatisé  
- la stabilité long-terme  
- un workflow ZERO-ERROR

----------------------------------------------------------------------
2. STACK TECHNIQUE

Flutter Web  
Dart 3.x  
Architecture SPA  
UI responsive

Hébergement :  
Vercel (Other framework)  
Domaine :  
qrpruf.sanadidari.com  
www.qrpruf.sanadidari.com

Pipeline CI/CD :  
- build_web.yml (Flutter → Vercel)  
- mirror.yml (sync repo privé → miroir public)

----------------------------------------------------------------------
3. STRUCTURE REPOSITORY

/lib                  → Code Flutter  
/web                  → Entrée Flutter Web  
/docs                 → Documentation militaire officielle  
/.github/workflows   → CI/CD (build + mirror)  
/pubspec.yaml         → Dépendances  
/vercel.json          → Routage SPA  
/build/web            → Build généré automatiquement (ignoré)

L’agent doit vérifier cette structure à chaque démarrage.

----------------------------------------------------------------------
4. INFRASTRUCTURE VERCEL

Build command : `flutter build web --release`  
Output directory : `build/web`

Routing SPA garanti par vercel.json :  
`{ "src": "/(.*)", "dest": "/index.html" }`

DNS :  
qrpruf.sanadidari.com → CNAME → vercel-dns-017.com  
SSL actif

----------------------------------------------------------------------
5. INTELLIGENCE HISTORIQUE (RÉSUMÉ)

🟥 2025-12-01 — Abandon HostPapa  
Incompatibilités → Migration stratégique vers Vercel.

🟦 2025-12-02 — Base Flutter Web initiale  
UI + assets + tests locaux.

🟩 2025-12-03 — Création du système documentaire militaire  
Standardisation /docs + PRO MODE.

🟧 2025-12-04 — Migration complète Vercel  
Domaine + DNS + SSL + routage SPA.

🟪 2025-12-04 — Installation CI/CD  
workflows build_web.yml + mirror.yml.

🟥 2025-12-05 — Création du miroir GitHub  
SSH sync + clé MIRROR_DEPLOY_KEY + pipeline opérationnel.

🟦 2025-12-06 — Passage en MODE MILITAIRE v2.0  
Documentation réécrite, protocole strict, règles PRO.

🟦 2025-12-06 — Mise à jour AGENT_START.md (auto-boot v2.0)  
Actions :  
- Ajout du message de démarrage militaire  
- Activation protocole auto-boot  
- Standardisation du lancement des sessions  
Résultat :  
✔ Agents démarrent automatiquement selon le protocole  
✔ Plus aucune demande manuelle pour lancer les SCANS

----------------------------------------------------------------------
6. POINTS DE VIGILANCE

- Page blanche Flutter (souvent base-href)  
- Assets manquants  
- Mauvaise configuration vercel.json  
- Flutter version mismatch  
- SSH mirror key incorrecte  
- Propagation DNS lente

----------------------------------------------------------------------
7. ÉTAT GITHUB (PRIVÉ + MIROIR)

Repo privé : OK  
Branche : main  
Workflows :  
✔ build_web.yml  
✔ mirror.yml  
Secrets :  
✔ VERCEL_TOKEN  
✔ MIRROR_DEPLOY_KEY

Repo miroir : OK  
Statut sync : SYNC

----------------------------------------------------------------------
8. STATE_CODE — ÉTAT DU CODE FLUTTER

/lib   → stable  
/web   → stable  
index.html → conforme Vercel  
flutter_bootstrap.js → OK  
assets → OK  
Compatibilité Flutter Web : OK

----------------------------------------------------------------------
9. STATE_INFRA — INFRASTRUCTURE

GitHub Actions : opérationnel  
Miroir SSH : opérationnel  
DNS Vercel : opérationnel  
Pipeline complet : OPÉRATIONNEL

----------------------------------------------------------------------
10. STATE_DOCS — DOCUMENTATION

/docs complet, version militaire v2.0  
Protocole strict appliqué  
Ordre de lecture figé et obligatoire  
Cohérence vérifiée

----------------------------------------------------------------------
11. MISSION LOG (TÂCHES)

✔ Terminé  
- Migration HostPapa → Vercel  
- Pipeline CI/CD  
- Système miroir SSH  
- Documentation militaire v2.0  
- Mise à jour AGENT_START.md (auto-boot v2.0)

🔄 En cours  
- Déploiement Flutter Web → Vercel (NEXT_ACTION)

🟦 À faire  
- Pipeline complet automatisé  
- Versioning  
- Tests utilisateurs  
- API Backend  
- Version mobile Android  

⛔ Bloqué  
Aucun

----------------------------------------------------------------------
FIN DU FICHIER — STATE_PROJECT.md v2.0
