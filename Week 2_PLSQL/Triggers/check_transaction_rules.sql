CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON transactions
FOR EACH ROW
DECLARE
    v_balance NUMBER;
BEGIN
    IF :NEW.amount < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Deposit amount must be positive');
    END IF;
    
    IF :NEW.transaction_type = 'withdrawal' THEN
        SELECT balance INTO v_balance
        FROM accounts
        WHERE account_id = :NEW.account_id;
        
        IF v_balance < :NEW.amount THEN
            RAISE_APPLICATION_ERROR(-20002, 'Insufficient balance for withdrawal');
        END IF;
    END IF;
END CheckTransactionRules;
/
