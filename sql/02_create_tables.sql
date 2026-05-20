CREATE TABLE insurance.ref_gender (
    gender_id SERIAL PRIMARY KEY,
    gender_label VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE insurance.ref_contract_type (
    contract_type_id SERIAL PRIMARY KEY,
    contract_type_label VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE insurance.policyholders (
    policyholder_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    gender_id INT NOT NULL,
    email VARCHAR(150),
    phone VARCHAR(50),
    address VARCHAR(255),
    city VARCHAR(100),
    salary DECIMAL(12,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_policyholders_gender
        FOREIGN KEY (gender_id)
        REFERENCES insurance.ref_gender(gender_id)
);

CREATE TABLE insurance.policies (
    policy_id SERIAL PRIMARY KEY,
    policyholder_id INT NOT NULL,
    contract_type_id INT NOT NULL,
    policy_number VARCHAR(50) NOT NULL UNIQUE,
    start_date DATE NOT NULL,
    end_date DATE,
    premium_amount DECIMAL(12,2),

    CONSTRAINT fk_policies_policyholders
        FOREIGN KEY (policyholder_id)
        REFERENCES insurance.policyholders(policyholder_id),

    CONSTRAINT fk_policies_contract_type
        FOREIGN KEY (contract_type_id)
        REFERENCES insurance.ref_contract_type(contract_type_id)
);

CREATE TABLE insurance.claims (
    claim_id SERIAL PRIMARY KEY,
    policy_id INT NOT NULL,
    claim_date DATE NOT NULL,
    claim_amount DECIMAL(12,2) NOT NULL,
    claim_status VARCHAR(50) NOT NULL,
    claim_description TEXT,

    CONSTRAINT fk_claims_policies
        FOREIGN KEY (policy_id)
        REFERENCES insurance.policies(policy_id)
);

CREATE TABLE insurance.payments (
    payment_id SERIAL PRIMARY KEY,
    claim_id INT NOT NULL REFERENCES claims(claim_id),
    payment_date DATE NOT NULL,
    payment_amount NUMERIC(12,2) NOT NULL CHECK (payment_amount > 0),
    payment_method VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);