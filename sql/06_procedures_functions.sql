-- Procédure pour mettre à jour le statut d'un sinistre
CREATE OR REPLACE PROCEDURE sp_update_claim_status(
    p_claim_id INT,
    p_new_status_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE claims
    SET claim_status_id = p_new_status_id
    WHERE claim_id = p_claim_id;
END;
$$;

CREATE OR REPLACE PROCEDURE sp_flag_claim_as_fraud(
    p_claim_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE claims
    SET fraud_flag = TRUE
    WHERE claim_id = p_claim_id;
END;
$$;

CREATE OR REPLACE PROCEDURE sp_add_claim_payment(
    p_claim_id INT,
    p_payment_date DATE,
    p_payment_amount NUMERIC,
    p_payment_method VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO claim_payments (
        claim_id,
        payment_date,
        payment_amount,
        payment_method
    )
    VALUES (
        p_claim_id,
        p_payment_date,
        p_payment_amount,
        p_payment_method
    );
END;
$$;

CREATE OR REPLACE PROCEDURE sp_close_claim(
    p_claim_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE claims
    SET claim_status_id = (
        SELECT claim_status_id
        FROM claim_statuses
        WHERE status_name = 'Closed'
    )
    WHERE claim_id = p_claim_id;
END;
$$;


CREATE OR REPLACE PROCEDURE sp_add_payment(
    p_claim_id INT,
    p_payment_date DATE,
    p_payment_amount NUMERIC,
    p_payment_method VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO payments (
        claim_id,
        payment_date,
        payment_amount,
        payment_method
    )
    VALUES (
        p_claim_id,
        p_payment_date,
        p_payment_amount,
        p_payment_method
    );
END;
$$;