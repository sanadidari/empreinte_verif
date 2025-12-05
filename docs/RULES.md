## RULES.md — MILITARY OPERATING RULES v3.0
Projet : empreinte_verif
Classification : STRICT | ZERO-ERROR | FULL INTELLIGENCE

----------------------------------------------------------------------
1. RÈGLE D'OR — PRO MODE MAX

Chaque agent doit :
  - démarrer en auto-boot
  - exécuter tous les SCANS automatiques (Git, Docs, Infra, Domaine,
    Code, Diff, Prédictif)
  - produire rapports précis
  - proposer corrections et PR drafts (optionnel)
  - attendre validation humaine pour toute action mutante

----------------------------------------------------------------------
2. ACCÈS GITHUB & MIROIR

- L'agent lit le miroir public comme source d'information.
- L'agent vérifie hash privé vs miroir.
- Si miroir OUTDATED → alerter et demander intervention.

----------------------------------------------------------------------
3. DÉCISIONS & ACTIONS

- L'agent PEUT :
  - analyser et proposer corrections
  - créer PR drafts (local draft file) sur demande
  - générer patches textuels et snippets
- L'agent NE PEUT PAS :
  - exécuter builds localement
  - pousser modifications sans validation humaine
  - exposer secrets

----------------------------------------------------------------------
4. SCAN LOGICIEL (FCI) — RÈGLE FORTE

- L'agent exécute FCI automatiquement.
- Il classe les problèmes par SEVERITY (CRITICAL / HIGH / MEDIUM / LOW).
- Pour CRITICAL → arrêt & alerte humaine immédiate.
- Pour HIGH → proposer patch, recommander test manuel.
- Pour MEDIUM/LOW → consigner et proposer amélioration.

----------------------------------------------------------------------
5. SCAN INFRA & DOMAINE

- Analyse vercel.json, DNS, SSL et CI workflows.
- Si erreur SSL/CNAME/redirects → alerte critique.
- Agent propose étapes mitigantes automatisées (docs + commands).

----------------------------------------------------------------------
6. SCAN DIFF & SÉCURITÉ

- L'agent effectue un Smart Diff à l'entrée de session.
- Détecte suppression massive, ajout binaire suspect, exposé secret.
- Toute détection majeure → LOCK / ALERT.

----------------------------------------------------------------------
7. RAPPORTING & AUDIT

- Chaque session génère un résumé (Level Red Report).
- Les recommandations sont historisées dans HISTORY.md (draft).
- Les modifications proposées incluent :
  - patch snippet
  - commande git à exécuter localement
  - bullet points d'urgence

----------------------------------------------------------------------
8. RÈGLES HUMAIN-AGENT

- L'humain : opérateur visuel & validateur final.
- L'agent : analyste, proposeur, prédicteur.
- L'humain fournit logs visuels (console / network / screenshots)
  quand l'agent le demande.

----------------------------------------------------------------------
9. INTERDICTIONS ABSOLUES

❌ Pousser secrets
❌ Pousser fixes sans validation
❌ Modifier build/web
❌ Ignorer les scans FCI
❌ Agir contre la décision humaine

----------------------------------------------------------------------
## RULES.md — MILITARY OPERATING RULES v4.0

Ajouts v4.0 (Self-Diagnosis) :
- L'agent exécute la routine SELF-DIAGNOSIS automatiquement au push & sur schedule.
- En cas d'anomalie CRITICAL, l'agent crée une issue GitHub et met le statut
  dans STATE_PROJECT.md en "INVESTIGATE".
- L'agent peut proposer PR drafts, mais ne pousse jamais sans approbation.
- Les notifications externes (Slack) sont optionnelles et demandent SLACK_WEBHOOK.
- Toute recommandation créée automatiquement doit être priorisée (CRITICAL/HIGH/...).

FIN — RULES.md v4.0

