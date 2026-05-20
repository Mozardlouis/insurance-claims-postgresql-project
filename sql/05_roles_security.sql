-- ============================================================
-- 1. Création de roles hiérarchiques
-- ============================================================

CREATE ROLE level1;
CREATE ROLE level2;
CREATE ROLE level3;
CREATE ROLE level4;

-- Héritage des Roles
GRANT level1 TO level2;
GRANT level2 TO level3;
GRANT level3 TO level4;



--Role de level1
GRANT CONNECT ON DATABASE insurance_claims_db TO level1;
GRANT USAGE ON SCHEMA public TO level1;

GRANT SELECT ON policy_types TO level1;
GRANT SELECT ON contract_types TO level1;
GRANT SELECT ON claim_types TO level1;
GRANT SELECT ON claim_statuses TO level1;

GRANT SELECT (
    customer_id,
    first_name,
    last_name,
    birth_date,
    gender_id,
    city
)
ON customers TO level1;

--Role de level2
GRANT SELECT ON policies TO level2;
GRANT SELECT ON claims TO level2;
GRANT SELECT ON payments TO level2;



--Modification opérationnelle
GRANT INSERT, UPDATE ON claims TO level3;
GRANT INSERT, UPDATE ON payments TO level3;

GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO level3;

--Accès complet
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO level4;
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO level4;
GRANT SELECT ON customers TO level4; --pour un accès complet à la table