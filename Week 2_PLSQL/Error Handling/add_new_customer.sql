CREATE OR REPLACE PROCEDURE AddNewCustomer (
    p_customer_id IN NUMBER,
    p_customer_name IN VARCHAR2,
    p_customer_age IN NUMBER
) IS
    customer_exists EXCEPTION;
BEGIN
    INSERT INTO customers (customer_id, customer_name, customer_age)
    VALUES (p_customer_id, p_customer_name, p_customer_age);

    COMMIT;

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        RAISE customer_exists;
    WHEN customer_exists THEN
        INSERT INTO error_log (error_message, error_time) VALUES ('Customer with ID ' || p_customer_id || ' already exists', SYSDATE);
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO error_log (error_message, error_time) VALUES (SQLERRM, SYSDATE);
END AddNewCustomer;
/
