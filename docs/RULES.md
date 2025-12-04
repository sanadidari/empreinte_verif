# RULES.md — Règles Officielles du Projet (PRO MODE)

---

# 🔷 RÈGLE D’OR — PRO MODE ABSOLU
L’agent doit fonctionner **en mode professionnel strict** :

- Réponses précises, structurées, sans blabla.
- Priorité absolue à la fiabilité, la vérification et la documentation.
- Un agent n’exécute JAMAIS une action sans validation explicite de l’utilisateur.
- Une seule action technique par étape.

**L’agent est responsable de la stabilité du projet.**

---

# 🔷 RÈGLE 1 — Lecture et Chargement Obligatoires
Avant toute réponse technique, l’agent doit OBLIGATOIREMENT :

1. Lire les fichiers suivants dans `/docs` :  
   - `STATE_PROJECT.md`  
   - `TASKS.md`  
   - `HISTORY.md`  
   - `RULES.md`  
   - `AGENT_START.md`  
   - `VERCEL_DEPLOY.md`  
   - `ARCHITECTURE.md`

2. Charger la branche **main** du dépôt GitHub :  
   `https://github.com/sanadidari/empreinte_verif`

3. Vérifier l’état du projet :  
   - `pubspec.yaml`  
   - dossier `lib/`  
   - dossier `web/`  
   - workflow `build_web.yml`  
   - fichier `vercel.json`  

4. Résumer :  
   - Ce qu’il a compris du projet  
   - L’état actuel  
   - La vraie **prochaine action**

Aucune réponse technique n’est permise avant cette analyse.

---

# 🔷 RÈGLE 2 — Processus PRO (obligatoire)
Toute intervention suit EXACTEMENT ces étapes :

1. **Proposition** (claire, structurée, limitée à 1 action)  
2. **Validation utilisateur**  
3. **Exécution** (fichier complet, pas d’extrait)  
4. **Mise à jour obligatoire** :  
   - `/docs/TASKS.md`  
   - `/docs/HISTORY.md`  
   - `/docs/STATE_PROJECT.md`  
   - OU tout autre fichier impacté

⚠️ Aucune étape n’est sautée.  
⚠️ Aucun fichier ne doit être modifié partiellement.

---

# 🔷 RÈGLE 3 — Aucune invention
L’agent NE DOIT JAMAIS :
- inventer une étape du projet  
- inventer un fichier  
- créer un fichier sans validation  
- interpréter sans vérifier dans GitHub  
- modifier plusieurs choses à la fois  

L’agent doit demander :  
> “Souhaites-tu que j’exécute cette action ?”

---

# 🔷 RÈGLE 4 — Gestion du Déploiement (CI/CD)
Déploiement officiel :

```
GitHub → GitHub Actions → Vercel Production
```

L’agent doit vérifier :

- intégrité du workflow : `.github/workflows/build_web.yml`
- token Vercel (`VERCEL_TOKEN`)
- présence du dossier `build/web/`
- mise à jour du fichier `vercel.json`

Aucun déploiement manuel n’est autorisé.

---

# 🔷 RÈGLE 5 — Vérification Flutter Web
Avant de proposer un changement :

- Vérifier `flutter clean` & `pub get`  
- Vérifier la compatibilité SDK (`>=3.0.0 <4.0.0`)  
- Vérifier le dossier `web/`  
- Vérifier la cohérence du routing SPA  

⚠️ L’agent doit signaler tout risque : page blanche, routing 404, assets manquants.

---

# 🔷 RÈGLE 6 — DNS & Domaine (Vercel)
L’agent doit respecter les règles suivantes :

- Le domaine officiel : `qrpruf.sanadidari.com`
- DNS gérés chez HostPapa  
- CNAME doit pointer vers :  
  `*.vercel-dns-017.com` (pas l’ancien `cname.vercel-dns.com`)
- SSL est automatique → agent NE doit JAMAIS tenter de le modifier

Toute anomalie doit être :
- Diagnostiquée
- Documentée dans HISTORY.md
- Corrigée étape par étape

---

# 🔷 RÈGLE 7 — Mise à jour Documentation `/docs`
Après chaque action validée, l’agent met à jour :

- `STATE_PROJECT.md`  
- `TASKS.md`  
- `HISTORY.md`  
- `VERCEL_DEPLOY.md` (si déploiement ou DNS modifié)  

Un agent ne doit jamais laisser l’état documentaire décalé.

---

# 🔷 RÈGLE 8 — Communication PRO
- Toujours structuré  
- Toujours clair  
- Toujours en mode “ingénieur”  
- Pas de phrases inutiles  
- Résultats orientés production  
- Fournir des fichiers complets, jamais partiels  

---

# 🔷 RÈGLE 9 — Interruption et sécurité
L’agent doit interrompre toute action s'il détecte :

- incohérence dans l’état du projet  
- conflit Git  
- build cassé  
- DNS invalide  
- routing Flutter incorrect  
- version SDK incompatible  

L’agent doit alors demander :
> “Souhaites-tu que je corrige ce problème avant d’avancer ?”

---

# 🔷 RÈGLE 10 — Validation Obligatoire
Sans validation explicite de l’utilisateur :  
➡️ **Aucune action n’est autorisée.**

L’agent doit demander la validation avant :  
- créer un fichier  
- modifier un fichier  
- déployer  
- ajuster DNS  
- modifier le pipeline CI/CD  

---

# 🟩 FIN DU DOCUMENT — RULES.md (PRO MODE)
