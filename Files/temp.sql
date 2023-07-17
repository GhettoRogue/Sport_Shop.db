CREATE TRIGGER trigger_sales_history
    AFTER INSERT
    ON table_sales
    FOR EACH ROW
BEGIN
    INSERT INTO table_sales_history (employee_id, customer_id, goods_id, sale_price, cost_price, manufacturer,
                                     sale_date)
    VALUES (NEW.employee_id, NEW.customer_id, NEW.goods_id, NEW.sale_price, NEW.cost_price, NEW.manufacturer,
            NEW.sale_date);
END;

CREATE TRIGGER trigger_employees_archive
    AFTER DELETE
    ON table_employees
    FOR EACH ROW
BEGIN
    INSERT INTO table_employees_archive (person_id, employee_id, position, status, date)
    VALUES (OLD.person_id, OLD.employee_id, OLD.position, 'Fired', NOW());
END;

CREATE TRIGGER trigger_employees_less_six
BEFORE INSERT
ON table_employees
FOR EACH ROW
BEGIN
IF NEW.employee_id <= 6 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Amount of employees must be less then 6!';
END IF;
END;

CREATE PROCEDURE procedure_insert_into_table_persons(IN _name VARCHAR(50), IN _email TEXT, IN _phone TEXT, _gender TEXT)
BEGIN
    IF NOT EXISTS(SELECT * FROM table_persons WHERE name = _name OR email = _email OR phone = _phone) THEN
        INSERT INTO table_persons (name, email, phone, gender) VALUES (_name, _email, _phone, _gender);
    END IF;
END;

