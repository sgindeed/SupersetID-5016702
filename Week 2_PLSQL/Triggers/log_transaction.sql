CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (transaction_id, account_id, amount, transaction_date, log_time)
    VALUES (:NEW.transaction_id, :NEW.account_id, :NEW.amount, :NEW.transaction_date, SYSDATE);
END LogTransaction;
/
