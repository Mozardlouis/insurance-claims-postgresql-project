CREATE OR REPLACE VIEW insurance.v_policyholders_public AS
SELECT
    policyholder_id,
    first_name,
    last_name,
    gender_id,
    email,
    city,
    created_at
FROM insurance.policyholders;

-- Vue niveau Manager avec données sensibles

CREATE OR REPLACE VIEW insurance.v_policyholders_sensitive AS
SELECT
    policyholder_id,
    first_name,
    last_name,
    gender_id,
    email,
    phone,
    address,
    city,
    salary,
    created_at
FROM insurance.policyholders;


--Vue des sinistres
CREATE OR REPLACE VIEW insurance.v_claims_overview AS
SELECT
    c.claim_id,
    p.policy_number,
    ph.first_name,
    ph.last_name,
    ct.contract_type_label,
    c.claim_date,
    c.claim_amount,
    c.claim_status
FROM insurance.claims c
JOIN insurance.policies p
    ON c.policy_id = p.policy_id
JOIN insurance.policyholders ph
    ON p.policyholder_id = ph.policyholder_id
JOIN insurance.ref_contract_type ct
    ON p.contract_type_id = ct.contract_type_id;