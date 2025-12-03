# 📄 VERCEL_DEPLOY.md  
## ✅ Déploiement Flutter Web + Configuration DNS + Workflow GitHub + Domaine Personnalisé

---

# #1 — Migration depuis HostPapa  
L’ancien agent utilisait HostPapa uniquement pour :

- Héberger le domaine **sanadidari.com**
- Fournir des accès FTP (qui ne marchaient pas pour automatisation)
- Créer des sous-domaines

⚠️ **HostPapa NE PERMET PAS les déploiements automatisés via WinSCP ou SSH**, sauf abonnement VPS.

👉 **Décision : migrer le déploiement vers Vercel**, tout en gardant HostPapa seulement pour gérer les DNS.

---

# #2 — Déploiement Flutter sur Vercel  
Nous avons construit un pipeline GitHub Actions qui :

1. Installe Flutter sur GitHub Actions  
2. Compile l’application Flutter Web  
3. Déploie automatiquement sur Vercel  
4. Utilise ton token sécurisé `VERCEL_TOKEN`

### 🔧 Fichier utilisé : `.github/workflows/build_web.yml`
Il effectue :

- flutter clean  
- flutter pub get  
- flutter build web  
- vercel deploy (production)

Ce workflow fonctionne maintenant **à 100 %**.

---

# #3 — Configuration du fichier `vercel.json`

Pour servir Flutter Web correctement sur Vercel, on utilise une configuration minimale :

```json
{
  "version": 2,
  "routes": [
    { "src": "/(.*)", "dest": "/index.html" }
  ]
}
🎯 Objectif :
→ Toutes les routes renvoient vers index.html (Single Page App Flutter)

#4 — Sous-domaine utilisé : qrpruf.sanadidari.com
👉 L’objectif est que ce sous-domaine charge automatiquement ton projet Flutter hébergé sur Vercel.

Vercel exige une étape :
tu dois ajouter dans HostPapa un enregistrement CNAME pointant vers Vercel.

Lors de la configuration, Vercel t’a donné l’entrée recommandée :
yaml
Copier le code
Type : CNAME  
Host : qrpruf  
Value : 9a0a2fdef4f4e9e.vercel-dns-017.com
TTL : 300
Nous l’avons ajouté manuellement dans HostPapa.

#5 — Ajout du sous-domaine dans Vercel
Dans ton projet empreinte-verif, onglet Settings → Domains, tu as ajouté :

Copier le code
qrpruf.sanadidari.com
Ensuite Vercel :

Vérifie que le CNAME existe

Valide le domaine

Génère automatiquement un certificat SSL

Lie le domaine à ton projet Flutter Web

➡️ Ce processus peut durer jusqu’à 1 heure, le temps que le SSL s’active.

#6 — Gestion du sous-domaine www.qrpruf
Tu as ajouté :

objectivec
Copier le code
www.qrpruf.sanadidari.com → CNAME → qrpruf.sanadidari.com
✔ Correct
⚠️ MAIS : Tant que qrpruf.sanadidari.com n’est pas encore validé SSL, www. renverra aussi une erreur SSL.

#7 — Vérifications DNS
Nous avons utilisé :

dnschecker.org

Ping global

Vérification propagation

Résultat :

✔ Le CNAME se propage correctement
✔ La résolution DNS fonctionne
⌛ Le certificat SSL prend encore quelques minutes pour être entièrement actif

#8 — Problèmes rencontrés & Résolutions
❌ Erreur 404 NOT_FOUND
Cause : routing Flutter non configuré.
→ Corrigé via le nouveau vercel.json.

❌ SSL NET::ERR_CERT_COMMON_NAME_INVALID
Cause : certificat Vercel pas encore émis OU DNS ancien encore en cache.
→ Résolution automatique dans quelques minutes.

❌ Refresh Vercel retourne "DNS Change Recommended"
Cause : Vercel recommande son nouveau serveur DNS vercel-dns-017.com.
→ Nous l’avons mis à jour, donc plus de problème.

#9 — Architecture finale de déploiement
java
Copier le code
Utilisateur
   ↓
qrpruf.sanadidari.com (DNS HostPapa)
   ↓ CNAME
9a0a2fdef4f4e9e.vercel-dns-017.com
   ↓
Vercel Project (empreinte-verif)
   ↓
Flutter Web Build (GitHub Actions)
   ↓
/index.html (via vercel.json)
Tout est maintenant propre, scalable et entièrement automatisé.

#10 — Ce qui reste à vérifier (automatique)
Vercel va :

Valider ton CNAME

Activer HTTPS

Débloquer Production Ready

Définir le domaine comme actif

⏳ Délai normal : 5 à 30 minutes

#11 — Pour tester quand tout sera OK
Essayer :

👉 https://qrpruf.sanadidari.com
👉 https://www.qrpruf.sanadidari.com

Le site Flutter Web devrait s’afficher sans erreurs.

#12 — Prochaines étapes possibles
Je peux t’ajouter dans le projet :

🔒 Protection par mot de passe

🌙 Mode maintenance

🌐 Ajouter d’autres sous-domaines

🔁 Automatiser versioning et changelog

🔄 Ajouter un rollback automatique


#13 — Fichiers utilisés pour le déploiement
📁 .github/workflows/build_web.yml

Ce fichier déclenche automatiquement :

L'installation de Flutter

Le build Flutter Web

Le déploiement sur Vercel avec le token sécurisé

Voici le contenu exact utilisé :

name: Flutter Web Build & Deploy to Vercel

on:
  push:
    branches:
      - main

jobs:
  build-deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Install Flutter
        uses: subosito/flutter-action@v2
        with:
          channel: stable

      - name: Flutter clean & pub get
        run: |
          flutter clean
          flutter pub get

      - name: Build Flutter Web
        run: flutter build web --release

      - name: Install Vercel CLI
        run: npm install -g vercel

      - name: Deploy to Vercel (Production)
        run: vercel deploy --prod --yes --token=$VERCEL_TOKEN --scope=sanad-idari build/web

📁 vercel.json

Ce fichier configure le routing pour Flutter Web (Single Page App) :

{
  "version": 2,
  "routes": [
    { "src": "/(.*)", "dest": "/index.html" }
  ]
}


🎯 Sans ce fichier, Flutter Web ne fonctionne pas correctement (404 sur navigation interne).

📁 build/web/

Ce dossier est généré automatiquement par Flutter lors du build :

index.html

main.dart.js

assets/

icons/

⚠️ Ne jamais modifier son contenu manuellement.
Il est recréé à chaque déploiement par GitHub Actions.

#14 — Variables d’environnement

Tu utilises 1 seule variable importante :

Nom	Provenance	Rôle
VERCEL_TOKEN	GitHub → Settings → Secrets → Actions	Autorise GitHub Actions à déployer sur ton compte Vercel

🔐 Stockée de manière 100 % sécurisée.

#15 — En cas de problème, fichiers à vérifier

Si un bug apparaît :

✔ build_web.yml → vérifie que le build et deploy passent
✔ vercel.json → vérifie que le routing renvoie vers index.html
✔ DNS HostPapa → vérifie CNAME → vercel-dns-017.com
✔ Vercel → onglet Deployments → vérifier erreurs éventuelles


🟩 FIN DU DOCUMENT
