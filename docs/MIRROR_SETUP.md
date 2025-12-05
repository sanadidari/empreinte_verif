## MIRROR_SETUP.md — GITHUB MIRROR DOSSIER (GMD-1)
Projet : empreinte_verif
Classification : STRICT — OPÉRATIONNEL — SÉCURISÉ

Ce document décrit la configuration officielle du miroir public utilisé
par les agents GPT pour lire le code sans exposer le dépôt privé.

----------------------------------------------------------------------
1. OBJECTIF DU MIROIR

Le miroir permet :
  - accès lecture agents GPT
  - protection du repo privé
  - synchro automatique
  - cohérence totale hash privé = hash miroir

Source unique de lecture :
  https://github.com/sanadidari/empreinte_verif_mirror

----------------------------------------------------------------------
2. ARCHITECTURE DU MIROIR

Source :      repo privé → empreinte_verif  
Destination : repo public → empreinte_verif_mirror  

Méthode :
  - GitHub Actions
  - clé SSH MIRROR_DEPLOY_KEY
  - push --force

----------------------------------------------------------------------
3. CONFIGURATION DES CLÉS SSH

1. Générer la clé SSH :
     ssh-keygen -t ed25519 -C "mirror"

2. Ajouter la clé publique AU MIROIR :
     Settings → Deploy Keys → Add key  
     Activer : Allow write access

3. Ajouter la clé privée AU REPO PRIVÉ :
     Settings → Secrets → Actions → MIRROR_DEPLOY_KEY

----------------------------------------------------------------------
4. WORKFLOW OFFICIEL — mirror.yml

```yaml
name: Mirror to Public Repo

on:
  push:
    branches: [ "main" ]

jobs:
  mirror:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout source repository
        uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Install SSH key
        uses: shimataro/ssh-key-action@v2
        with:
          key: ${{ secrets.MIRROR_DEPLOY_KEY }}
          known_hosts: github.com

      - name: Add mirror remote
        run: git remote add mirror \
             git@github.com:sanadidari/empreinte_verif_mirror.git

      - name: Force push to mirror
        run: git push --force mirror main
```

----------------------------------------------------------------------
5. COMPORTEMENT ATTENDU

À chaque push sur main :
  - le repo privé exécute le workflow
  - le miroir se met à jour
  - hash miroir = hash privé
  - agents GPT lisent le miroir

Si OUTDATED :
  - vérifier logs Actions
  - vérifier clé SSH
  - vérifier Deploy Key

----------------------------------------------------------------------
6. SÉCURITÉ MILITAIRE

Interdictions :
  ❌ exposer clé privée  
  ❌ committer id_ed25519  
  ❌ utiliser HTTPS pour miroir  
  ❌ modifier workflow sans validation  
  ❌ enlever write access du miroir  

Obligatoire :
  ✔ garder MIRROR_DEPLOY_KEY secret  
  ✔ vérifier sync status  
  ✔ utiliser push --force  

----------------------------------------------------------------------
FIN DU FICHIER — MIRROR_SETUP.md v1.1 (FORMAT 80 COLONNES)
