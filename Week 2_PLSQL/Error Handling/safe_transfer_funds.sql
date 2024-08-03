CREATE OR REPLACE PROCEDURE SafeTransferFunds (
    p_from_account_id IN NUMBER,
    p_to_account_id IN NUMBER,
    p_amount IN NUMBER
) IS
    insufficient_funds EXCEPTION;
    no_such_account EXCEPTION;
BEGIN
    DECLARE
        v_from_balance NUMBER;
        v_to_balance NUMBER;
    BEGIN
        SELECT balance INTO v_from_balance FROM accounts WHERE account_id = p_from_account_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE no_such_account;
    END;

    BEGIN
        SELECT balance INTO v_to_balance FROM accounts WHERE account_id = p_to_account_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE no_such_account;
    END;

    IF v_from_balance < p_amount THEN
        RAISE insufficient_funds;
    END IF;

    UPDATE accounts
    SET balance = balance - p_amount
    WHERE account_id = p_from_account_id;

    UPDATE accounts
    SET balance = balance + p_amount
    WHERE account_id = p_to_account_id;

    COMMIT;

EXCEPTION
    WHEN insufficient_funds THEN
        ROLLBACK;
        INSERT INTO error_log (error_message, error_time) VALUES ('Insufficient funds for transfer from account ' || p_from_account_id, SYSDATE);
    WHEN no_such_account THEN
        ROLLBACK;
        INSERT INTO error_log (error_message, error_time) VALUES ('One or both accounts do not exist for transfer', SYSDATE);
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO error_log (error_message, error_time) VALUES (SQLERRM, SYSDATE);
END SafeTransferFunds;
/
