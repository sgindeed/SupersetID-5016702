CREATE OR REPLACE PACKAGE CustomerManagement IS
    PROCEDURE AddNewCustomer(p_customer_id IN NUMBER, p_customer_name IN VARCHAR2, p_customer_age IN NUMBER);
    PROCEDURE UpdateCustomerDetails(p_customer_id IN NUMBER, p_customer_name IN VARCHAR2, p_customer_age IN NUMBER);
    FUNCTION GetCustomerBalance(p_customer_id IN NUMBER) RETURN NUMBER;
END CustomerManagement;
/

CREATE OR REPLACE PACKAGE BODY CustomerManagement IS
    PROCEDURE AddNewCustomer(p_customer_id IN NUMBER, p_customer_name IN VARCHAR2, p_customer_age IN NUMBER) IS
    BEGIN
        INSERT INTO customers (customer_id, customer_name, customer_age)
        VALUES (p_customer_id, p_customer_name, p_customer_age);
        COMMIT;
    END AddNewCustomer;
    
    PROCEDURE UpdateCustomerDetails(p_customer_id IN NUMBER, p_customer_name IN VARCHAR2, p_customer_age IN NUMBER) IS
    BEGIN
        UPDATE customers
        SET customer_name = p_customer_name, customer_age = p_customer_age
        WHERE customer_id = p_customer_id;
        COMMIT;
    END UpdateCustomerDetails;
    
    FUNCTION GetCustomerBalance(p_customer_id IN NUMBER) RETURN NUMBER IS
        v_balance NUMBER;
    BEGIN
        SELECT SUM(balance) INTO v_balance
        FROM accounts
        WHERE customer_id = p_customer_id;
        
        RETURN v_balance;
    END GetCustomerBalance;
END CustomerManagement;
/
