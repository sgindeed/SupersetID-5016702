CREATE OR REPLACE PROCEDURE UpdateSalary (
    p_employee_id IN NUMBER,
    p_percentage IN NUMBER
) IS
    no_such_employee EXCEPTION;
BEGIN
    UPDATE employees
    SET salary = salary * (1 + p_percentage / 100)
    WHERE employee_id = p_employee_id;

    IF SQL%NOTFOUND THEN
        RAISE no_such_employee;
    END IF;

    COMMIT;

EXCEPTION
    WHEN no_such_employee THEN
        ROLLBACK;
        INSERT INTO error_log (error_message, error_time) VALUES ('Employee ID ' || p_employee_id || ' does not exist', SYSDATE);
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO error_log (error_message, error_time) VALUES (SQLERRM, SYSDATE);
END UpdateSalary;
/
