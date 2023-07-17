INSERT INTO sport_shop.table_persons (name, email, phone, gender)
VALUES ('Vladimir', 'mail@mail.ru', '7-77-979-55', 'Male');
INSERT INTO sport_shop.table_persons (name, email, phone, gender)
VALUES ('Vladislav', 'mail@ya.ru', '7-87-445-32', 'Male');
INSERT INTO sport_shop.table_persons (name, email, phone, gender)
VALUES ('Svetlana', 'mail@ya.ru', '7-77-332-12', 'Female');
INSERT INTO sport_shop.table_persons (name, email, phone, gender)
VALUES ('Irina', 'mail@ya.ru', '7-33-445-79', 'Female');
INSERT INTO sport_shop.table_persons (name, email, phone, gender)
VALUES ('Michael', 'mail@mail.ru', '7-33-445-15', 'Male');
INSERT INTO sport_shop.table_persons (name, email, phone, gender)
VALUES ('Nikita', 'mail@gmail.com', '7-87-223-22', 'Male');

INSERT INTO table_goods (name, category, quantity, cost_price, manufacturer, sell_price)
VALUES ('Football', 'Sports Equipment', 'New', 20.00, 'Nike', 39.99);
INSERT INTO table_goods (name, category, quantity, cost_price, manufacturer, sell_price)
VALUES ('Soccer uniform', 'Sports Equipment', 'New', 80.00, 'Nike', 99.99);
INSERT INTO table_goods (name, category, quantity, cost_price, manufacturer, sell_price)
VALUES ('Football boots', 'Sports Equipment', 'New', 40.00, 'Adidas', 59.99);
INSERT INTO table_goods (name, category, quantity, cost_price, manufacturer, sell_price)
VALUES ('Football gloves', 'Sports Equipment', 'New', 10.00, 'Adidas', 29.99);

INSERT INTO table_customers (person_id, order_history, discount, subscribe)
VALUES ((SELECT person_id FROM table_persons WHERE name = 'Vladimir' AND email = 'mail@mail.ru'),
        'Order#4344',
        '0%',
        0);

INSERT INTO table_customers (person_id, order_history, discount, subscribe)
VALUES ((SELECT person_id FROM table_persons WHERE name = 'Vladislav'),
        'Order#4345',
        '5%',
        1);

INSERT INTO table_customers (person_id, order_history, discount, subscribe)
VALUES ((SELECT person_id FROM table_persons WHERE name = 'Svetlana'),
        'Order#4346',
        '10%',
        1);

INSERT INTO table_employees (person_id, position, hire_date, salary)
VALUES ((SELECT person_id FROM table_persons WHERE name = 'Irina'),
        'Manager', '12.12.2012',
        '3000$');

INSERT INTO table_employees (person_id, position, hire_date, salary)
VALUES ((SELECT person_id FROM table_persons WHERE name = 'Michael'),
        'Manager', '24.12.2012',
        '3000$');

INSERT INTO table_employees (person_id, position, hire_date, salary)
VALUES ((SELECT person_id FROM table_persons WHERE name = 'Nikita'),
        'Manager', '12.01.2012',
        '3000$');

INSERT INTO table_sales (employee_id, customer_id, sales_history_id, goods_id, sale_price, cost_price, manufacturer,
                         sale_date)
VALUES ((SELECT employee_id
         FROM table_employees
         WHERE person_id = (SELECT person_id FROM table_persons WHERE name = 'Irina')),
        (SELECT customer_id
         FROM table_customers
         WHERE person_id = (SELECT person_id FROM table_persons WHERE name = 'Vladimir')),
        1,
        (SELECT goods_id FROM table_goods WHERE name = 'Football'),
        39.99,
        20.00,
        'Nike',
        NOW());

INSERT INTO table_sales (employee_id, customer_id, sales_history_id, goods_id, sale_price, cost_price, manufacturer,
                         sale_date)
VALUES ((SELECT employee_id
         FROM table_employees
         WHERE person_id = (SELECT person_id FROM table_persons WHERE name = 'Michael')),
        (SELECT customer_id
         FROM table_customers
         WHERE person_id = (SELECT person_id FROM table_persons WHERE name = 'Vladislav')),
        2,
        (SELECT goods_id FROM table_goods WHERE name = 'Soccer uniform'),
        99.99,
        80.00,
        'Nike',
        NOW());

INSERT INTO table_sales (employee_id, customer_id, sales_history_id, goods_id, sale_price, cost_price, manufacturer,
                         sale_date)
VALUES ((SELECT employee_id
         FROM table_employees
         WHERE person_id = (SELECT person_id FROM table_persons WHERE name = 'Nikita')),
        (SELECT customer_id
         FROM table_customers
         WHERE person_id = (SELECT person_id FROM table_persons WHERE name = 'Svetlana')),
        3,
        (SELECT goods_id FROM table_goods WHERE name = 'Football boots'),
        59.99,
        40.00,
        'Adidas',
        NOW());