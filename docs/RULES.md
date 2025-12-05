# RULES.md — MILITARY OPERATING RULES (MOR-1) — v3.0
Projet : empreinte_verif — Règles Absolues des Agents GPT
Classification : STRICT | ZERO-ERROR | NON-NÉGOCIABLE

1. RÈGLE D'OR — PRO MODE STRICT
Chaque agent GPT travaillant sur ce projet doit :
- Répondre avec précision chirurgicale
- Être structuré, professionnel, sans bavardage
- Se baser uniquement sur :
  - les fichiers /docs
  - le code GitHub privé
  - le miroir public
- Refuser toute supposition
- Refuser toute action non validée

2. ACCÈS GITHUB — LOI ABSOLUE
(… contenu inchangé …)

3. RÉGIME DE TRAVAIL — UNE SEULE ACTION PAR ÉTAPE
(… contenu inchangé …)

4. LECTURE OBLIGATOIRE DES DOCS
(… contenu inchangé …)

5. VÉRIFICATIONS OBLIGATOIRES
(… contenu inchangé …)

6. MODULES AUTONOMES (POLITIQUE D’UTILISATION)
Les modules autonomes (v4 → v12) sont autorisés suivant ces règles strictes :

- Activation : L’exécution automatique doit être autorisée par le responsable (par défaut activée dans ce projet).
- Transparence : chaque exécution génère un rapport horodaté et un artefact (logs + summary).
- Atomicité : une seule modification automatique par workflow ; si plusieurs fichiers doivent être modifiés, l’agent produit un PR/draft pour validation.
- Rollback : tout changement automatique doit pouvoir être reverté par Smart Rollback (v10).
- Sensibilité : actions touchant secrets, clés, ou données d’auth doivent déclencher une approval humaine.
- Documentation : chaque exécution met à jour STATE_PROJECT.md et HISTORY.md automatiquement (v11).

7. RAPPORT INITIAL — FORMAT OBLIGATOIRE
Après scans, l’agent doit répondre EXACTEMENT ceci :

[PROTOCOL INITIAL REPORT – LEVEL RED]

1. Private repo access: OK/NON
2. Mirror repo access: OK/NON
3. Docs loaded: <liste>
4. Last commit (private): <hash>
5. Last commit (mirror): <hash>
6. Sync status: SYNC / OUTDATED
7. NEXT ACTION: <copie exacte>

Souhaites-tu valider l’exécution de l’étape 1 ?

Puis se taire en attente de validation.

8. CONDITIONS D'ARRÊT
(… contenu inchangé …)

9. RÈGLE SUPRÊME
(… contenu inchangé …)

🟥 FIN DU FICHIER — RULES.md v3.0
