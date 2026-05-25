-- =====================================================
-- PERFORMANCE ANALYSIS
-- =====================================================

-- 1. Claims filtered by status
EXPLAIN ANALYZE
SELECT *
FROM insurance.claims
WHERE claim_status = 'Approved';

-- 2. Claims filtered by date
EXPLAIN ANALYZE
SELECT *
FROM insurance.claims
WHERE claim_date BETWEEN '2024-01-01' AND '2024-12-31';

-- 3. Claims joined with policies
EXPLAIN ANALYZE
SELECT
    c.claim_id,
    c.claim_date,
    c.claim_amount,
    c.claim_status,
    p.policy_number
FROM insurance.claims c
JOIN insurance.policies p
    ON c.policy_id = p.policy_id;

-- 4. Payments by claim
EXPLAIN ANALYZE
SELECT
    claim_id,
    SUM(payment_amount) AS total_paid
FROM insurance.payments
GROUP BY claim_id;

-- 5. Full analytical query
EXPLAIN ANALYZE
SELECT
    ct.contract_type_label,
    COUNT(c.claim_id) AS total_claims,
    SUM(c.claim_amount) AS total_claim_amount,
    AVG(c.claim_amount) AS avg_claim_amount
FROM insurance.claims c
JOIN insurance.policies p
    ON c.policy_id = p.policy_id
JOIN insurance.ref_contract_type ct
    ON p.contract_type_id = ct.contract_type_id
GROUP BY ct.contract_type_label;