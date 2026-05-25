# Projet PostgreSQL – INSURANCE CLAIMS

## Présentation du projet

Ce projet consiste à concevoir une base de données PostgreSQL dédiée à l’analyse de sinistres d’assurance.

L’objectif est de construire une architecture SQL complète,déployable sur Azure,  sécurisée et optimisée permettant de gérer :

- les assurés,
- les contrats,
- les sinistres,
- les paiements,
- les droits d’accès utilisateurs,
- les performances SQL.

Ce projet s’inscrit dans ma démarche de constitution d'un portfolio en tant que :

- Data Engineer,
- Cloud Data Engineer,
- Azure Data Engineer.

---

# Objectifs techniques

Le projet permet de démontrer les compétences suivantes :

- Modélisation relationnelle
- PostgreSQL
- SQL avancé
- Clés primaires et étrangères
- Tables de référence
- Création de vues
- Procédures stockées
- Fonctions SQL
- Gestion des rôles et permissions
- Optimisation des performances
- Création d’index
- Analyse de performances avec `EXPLAIN ANALYZE`
- Automatisation PowerShell
- Versioning Git / GitHub

---

# Contexte métier

Les compagnies d’assurance manipulent un grand volume de données liées :

- aux assurés,
- aux contrats,
- aux déclarations de sinistres,
- aux remboursements.

Cette base permet de simuler un environnement simplifié de gestion de sinistres.

---

# Structure du projet

```text
insurance-claims-postgresql-project/
│
├── README.md
├── .gitignore
├── run_project.ps1
├── GIT.ps1
│
├── sql/
│   ├── 01_create_schema.sql
│   ├── 02_create_tables.sql
│   ├── 03_insert_reference_data.sql
│   ├── 04_create_views.sql
│   ├── 05_roles_security.sql
│   ├── 06_procedures_functions.sql
│   ├── 07_users_and_access.sql
│   └── 08_data_ingestion.sql
│
├── data/
├── docs/
└── scripts/
```
---
# Modèle de données

```text
| Table                         | Description                      |
| ----------------------------- | -------------------------------- |
| `insurance.ref_gender`        | Référentiel des genres           |
| `insurance.ref_contract_type` | Référentiel des types de contrat |
| `insurance.policyholders`     | Informations des assurés         |
| `insurance.policies`          | Contrats d’assurance             |
| `insurance.claims`            | Déclarations de sinistres        |
| `insurance.payments`          | Paiements liés aux sinistres     |


```

# Gestion des roles

le niveau des accès définis dans ce projet est le schéma hiérarchisé avec des héritiers.
level1
level2
level3
level4

# ** Automatisation Powershell**

Le projet peut s'exécuter automatiquement et entièrement via Powershell
.\run_project.ps1
Le script exécute les fichiers dans le bon ordre (indiqué)

# ** Évolutions possibles**

Les prochaines évolutions envisagées :

    -Déploiement Azure PostgreSQL
   - Azure Data Factory
   - Databricks
   - PySpark
   - Pipeline ETL
   - Reporting Power BI
   - Monitoring
   - CI/CD GitHub Actions
   - Row-Level Security


# ** Technologies utilisées**
   - PostgreSQL
   - pgAdmin
   - VS Code
   - PowerShell
   - Git
   - GitHub


 # **  Auteur**
   Mozard LOUIS
   Data Engineer, Data Analyst