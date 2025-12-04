# ARCHITECTURE.md — Architecture Complète du Projet (PRO MODE)

---

# 🔷 📌 Vue d’Ensemble

Le projet **Empreinte Vérif** utilise Flutter Web comme front-end,  
et s’appuie sur une architecture moderne :

```
Flutter Web  →  GitHub (main)  →  GitHub Actions CI/CD  →  Vercel Hosting  
DNS via HostPapa  →  CNAME vers Vercel Edge Network  
Domaine public : https://qrpruf.sanadidari.com
```

Cette architecture permet :

- Déploiement automatique  
- CDN Edge ultra rapide  
- SSL automatique  
- Routing SPA correct pour Flutter Web  
- Documentation complète dans `/docs`

---

# 🔷 🏗️ Architecture Technique Détaillée

## 1. ➤ **Application Flutter Web**
- Code source dans `lib/`
- Dossier web officiel dans `web/`
- Build généré automatiquement :  
  → `build/web/`

### ⚠️ Règle Flutter Web  
Le routing **doit obligatoirement** passer par :  
→ `/index.html`

Grâce au fichier `vercel.json`.

---

## 2. ➤ **Pipeline CI/CD — GitHub Actions**
Workflow :  
`.github/workflows/build_web.yml`

### Fonctionnement :
1. Checkout du code  
2. Installation de Flutter  
3. `flutter clean && flutter pub get`  
4. Build Web :  
   ```
   flutter build web --release
   ```
5. Installation CLI Vercel  
6. Déploiement automatique :  
   ```
   vercel deploy --prod --token=$VERCEL_TOKEN --scope=sanad-idari build/web
   ```

### Rôle du pipeline :
- Automatiser entièrement la production  
- Garantir un build propre  
- Éviter toute manipulation manuelle

---

## 3. ➤ **Vercel — Hébergement & Edge Network**

### Vercel gère automatiquement :
- CDN global  
- SSL Let's Encrypt  
- Redirections  
- Previews (si activés)  
- Routing SPA via `vercel.json` :

```json
{
  "version": 2,
  "routes": [
    { "src": "/(.*)", "dest": "/index.html" }
  ]
}
```

### Projet Vercel utilisé :
- **empreinte-verif** (production)

---

## 4. ➤ **DNS — HostPapa (gestion uniquement)**

HostPapa n’héberge plus le site.  
Il sert UNIQUEMENT à stocker les DNS.

### DNS officiels :

```
qrpruf.sanadidari.com → CNAME → 9a0a2fdeff44fe9e.vercel-dns-017.com
www.qrpruf.sanadidari.com → CNAME → qrpruf.sanadidari.com
```

### Pourquoi ce CNAME ?
- C’est le CNAME recommandé par Vercel  
- Il active le SSL  
- Il relie automatiquement Vercel ↔ domaine

---

# 🔷 🗺️ Schéma d’Architecture (ASCII)

```
                   ┌─────────────────────────────────┐
                   │         HostPapa DNS            │
                   │  CNAME qrpruf → vercel-dns      │
                   └───────────────┬─────────────────┘
                                   │
                                   ▼
                     ┌──────────────────────────┐
                     │        Vercel            │
                     │   - SSL (Let's Encrypt)  │
                     │   - CDN Edge Network     │
                     │   - Routing SPA          │
                     │   - Production Hosting   │
                     └─────────────┬────────────┘
                                   │
                                   ▼
                    ┌────────────────────────────┐
                    │   GitHub Actions CI/CD     │
                    │  flutter build web         │
                    │  vercel deploy --prod      │
                    └──────────────┬─────────────┘
                                   │
                                   ▼
                     ┌──────────────────────────┐
                     │     Flutter Web App      │
                     │      build/web/          │
                     │  index.html (root)       │
                     └──────────────────────────┘
```

---

# 🔷 🔒 Points Critiques de l’Architecture

## 1. Vercel gère TOUT le hosting  
HostPapa ne sert plus → juste DNS.

## 2. CI/CD obligatoire  
Aucun déploiement manuel n'est autorisé.

## 3. `vercel.json` est indispensable  
Sinon Flutter Web produit des erreurs 404.

## 4. Le domaine doit rester sur  
`*.vercel-dns-017.com`  
pas les anciennes versions.

## 5. Les docs doivent rester synchronisées  
→ `/docs` est la source de vérité.

---

# 🔷 🔧 Améliorations possibles
- Ajouter une branche **staging** → preview Vercel  
- Ajouter du cache Flutter → build plus rapide  
- Mettre en place tests automatiques Flutter Web  
- SEO & performance Lighthouse  
- Monitoring Vercel (logs, trafic, erreurs)

---

# 🟩 FIN DU DOCUMENT — ARCHITECTURE.md
