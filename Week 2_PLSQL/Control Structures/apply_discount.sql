DECLARE
    CURSOR customer_cursor IS
        SELECT customer_id, age, loan_interest_rate
        FROM customers
        WHERE age > 60;
    
    customer_record customer_cursor%ROWTYPE;
    
BEGIN
    FOR customer_record IN customer_cursor LOOP
        UPDATE loans
        SET interest_rate = customer_record.loan_interest_rate - 1
        WHERE customer_id = customer_record.customer_id;
    END LOOP;
    
    COMMIT;
END;
/
