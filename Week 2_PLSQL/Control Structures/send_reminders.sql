DECLARE
    CURSOR loan_cursor IS
        SELECT l.loan_id, l.due_date, c.customer_id, c.customer_name
        FROM loans l
        JOIN customers c ON l.customer_id = c.customer_id
        WHERE l.due_date BETWEEN SYSDATE AND SYSDATE + 30;
    
    loan_record loan_cursor%ROWTYPE;
    
BEGIN
    FOR loan_record IN loan_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('Reminder: Dear ' || loan_record.customer_name || ', your loan with ID ' || loan_record.loan_id || ' is due on ' || TO_CHAR(loan_record.due_date, 'DD-MON-YYYY') || '.');
    END LOOP;
END;
/
