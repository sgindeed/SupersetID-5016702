DECLARE
    CURSOR transaction_cursor IS
        SELECT c.customer_id, c.customer_name, t.transaction_id, t.transaction_date, t.amount
        FROM customers c
        JOIN transactions t ON c.customer_id = t.customer_id
        WHERE t.transaction_date BETWEEN TRUNC(SYSDATE, 'MM') AND LAST_DAY(SYSDATE)
        ORDER BY c.customer_id, t.transaction_date;
    
    v_last_customer_id NUMBER := NULL;
    
BEGIN
    OPEN transaction_cursor;
    
    LOOP
        FETCH transaction_cursor INTO v_customer_id, v_customer_name, v_transaction_id, v_transaction_date, v_amount;
        EXIT WHEN transaction_cursor%NOTFOUND;
        
        IF v_last_customer_id IS NULL OR v_last_customer_id != v_customer_id THEN
            IF v_last_customer_id IS NOT NULL THEN
                DBMS_OUTPUT.PUT_LINE('----------------------------------------');
            END IF;
            DBMS_OUTPUT.PUT_LINE('Customer: ' || v_customer_name);
            DBMS_OUTPUT.PUT_LINE('Transaction Date  |  Transaction ID  |  Amount');
            DBMS_OUTPUT.PUT_LINE('----------------------------------------');
            v_last_customer_id := v_customer_id;
        END IF;
        
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_transaction_date, 'DD-MON-YYYY') || '  |  ' || v_transaction_id || '  |  ' || v_amount);
    END LOOP;
    
    CLOSE transaction_cursor;
    
    IF v_last_customer_id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    END IF;
END;
/
