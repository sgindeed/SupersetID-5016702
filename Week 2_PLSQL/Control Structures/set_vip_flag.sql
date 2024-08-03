DECLARE
    CURSOR customer_cursor IS
        SELECT customer_id, balance
        FROM customers
        WHERE balance > 10000;
    
    customer_record customer_cursor%ROWTYPE;
    
BEGIN
    FOR customer_record IN customer_cursor LOOP
        UPDATE customers
        SET IsVIP = TRUE
        WHERE customer_id = customer_record.customer_id;
    END LOOP;
    
    COMMIT;
END;
/
