# STATE PROJECT — SANAD IDARI

## 🔷 Stack technique
- Flutter Web
- Hébergement : Vercel
- Pipeline : GitHub → Vercel (main)
- Domaine : https://qrpruf.sanadidari.com

## 🔷 Fichier vercel.json actuel
{
  "builds": [
    { "src": "web/index.html", "use": "@vercel/static" }
  ],
  "routes": [
    { "src": "/(.*)", "dest": "/index.html" }
  ]
}

## 🔷 Historique migration
- HostPapa supprimé
- Scripts PowerShell supprimés
- Watchdog supprimé
- Migration Vercel terminée

## 🔷 Vérification CI/CD & GitHub
- Présence de build_web.yml confirmée (GitHub Actions)
- Présence de vercel.json confirmée
- Structure Flutter Web valide (web/index.html → FOUND)
- pubspec.yaml OK (SDK >=3.0.0 <4.0.0)

## 🔷 Points de vigilance
- Tester routing sur Vercel Preview
- Vérifier logs en cas de page blanche

## 🔷 TODO
- SEO Flutter Web
- README pro

## 🔷 State GitHub
- Repo : sanadidari/empreinte_verif
- Branche : main
- Dernière vérification : 2025-12-05
- État : OK et synchronisé

## 🔷 Résumé des tâches
- Terminé :
    • Migration Vercel  
    • Nettoyage système  
    • Pipeline CI (GitHub Actions)  
    • Synchronisation docs  
- En cours :
    • Configuration du déploiement Vercel  
- À faire :
    • Paramétrage Framework / Build / Output  
    • Premier déploiement  
    • Mise à jour docs après déploiement  

## 🔷 Mise à jour du 2025-12-05
- Vérification complète du projet par agent GPT  
- Synchronisation TASKS / STATE / HISTORY  
- Système conforme à la Règle d’Or
