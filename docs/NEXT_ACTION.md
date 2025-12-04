# NEXT_ACTION.md — Prochaine Action Officielle (PRO MODE)

---

# 🔥 PROCHAINE ACTION
➡️ **Finaliser la validation de production du domaine Vercel (`qrpruf.sanadidari.com`).**

Le déploiement Flutter Web est déjà en place, le pipeline CI/CD fonctionne,  
le DNS est configuré et propagé —  
il reste à finaliser l’activation SSL + validation domaine côté Vercel.

---

# 🔷 Étapes à effectuer (PROCEDURE OFFICIELLE)

## 1️⃣ Vérifier le statut du domaine dans Vercel
- Aller dans :  
  https://vercel.com/sanad-idari/empreinte-verif/settings/domains
- Vérifier :
  - `qrpruf.sanadidari.com` : status  
  - `www.qrpruf.sanadidari.com` : redirection

## 2️⃣ Cliquer sur **Refresh**
- Attendre la validation de Vercel  
- Observation :  
  - Si Vercel voit le bon CNAME → SSL se génère automatiquement  
  - Si Vercel affiche “DNS Change Recommended” → attendre propagation  
    (ou vérifier que le CNAME actuel pointe bien sur `*.vercel-dns-017.com`)

## 3️⃣ Vérifier le SSL
Une fois validé, Vercel affichera :
```
Status : Valid Configuration
SSL : Active (Let's Encrypt)
```

## 4️⃣ Tester l’accès production
- Tester : https://qrpruf.sanadidari.com  
- Tester : https://www.qrpruf.sanadidari.com  
- Tester navigation interne Flutter Web (SPA)  

## 5️⃣ Mettre à jour les documents `/docs`
Si le domaine est validé :
- Mettre à jour `STATE_PROJECT.md`
- Mettre à jour `TASKS.md`
- Ajouter l’entrée dans `HISTORY.md`

---

# 🔷 NOTE IMPORTANTE
Cette action s’inscrit dans la continuité des opérations déjà effectuées :

- Déploiement Vercel → OK  
- GitHub Actions → OK  
- vercel.json → OK  
- DNS HostPapa → OK  
- Propagation → OK  
- Documentation → OK  

Il ne reste que **la validation finale du domaine** côté Vercel.

---

# 🔷 Prochaine action après celle-ci (sera remplacée ici)
➡️ **Tester la version de production Flutter Web et valider la première livraison.**

(⚠️ Cette étape NE doit être écrite qu’après validation du domaine → mise à jour automatique)

---

# 🟩 FIN DU DOCUMENT — NEXT_ACTION.md
