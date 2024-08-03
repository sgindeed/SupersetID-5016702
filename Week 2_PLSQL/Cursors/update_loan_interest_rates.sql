DECLARE
    CURSOR loan_cursor IS
        SELECT loan_id, interest_rate
        FROM loans;
    
    v_loan_id loans.loan_id%TYPE;
    v_interest_rate loans.interest_rate%TYPE;
    v_new_interest_rate NUMBER;
    
BEGIN
    OPEN loan_cursor;
    
    LOOP
        FETCH loan_cursor INTO v_loan_id, v_interest_rate;
        EXIT WHEN loan_cursor%NOTFOUND;
        
        v_new_interest_rate := v_interest_rate + 0.5;
        
        UPDATE loans
        SET interest_rate = v_new_interest_rate
        WHERE loan_id = v_loan_id;
    END LOOP;
    
    CLOSE loan_cursor;
    
    COMMIT;
END;
/
