CREATE TABLE table_goods
(
    goods_id     INTEGER PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(50) NOT NULL,
    category     VARCHAR(20) NOT NULL,
    quantity     TEXT        NOT NULL,
    cost_price   REAL        NOT NULL,
    sell_price   REAL        NOT NULL,
    manufacturer VARCHAR(20) NOT NULL
);

CREATE TABLE table_persons
(
    person_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name      VARCHAR(50) NOT NULL,
    email     TEXT        NOT NULL,
    phone     TEXT        NOT NULL,
    gender    TEXT        NOT NULL
);

CREATE TABLE table_employees
(
    employee_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    person_id   INTEGER NOT NULL,
    position    TEXT    NOT NULL,
    hire_date   TEXT    NOT NULL,
    salary      TEXT    NOT NULL,
    FOREIGN KEY (person_id) REFERENCES table_persons (person_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE table_customers
(
    customer_id   INTEGER PRIMARY KEY AUTO_INCREMENT,
    person_id     INTEGER NOT NULL,
    order_history TEXT    NOT NULL,
    discount      TEXT    NOT NULL,
    subscribe     INTEGER NOT NULL,
    FOREIGN KEY (person_id) REFERENCES table_persons (person_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE table_sales
(
    sale_id          INTEGER PRIMARY KEY AUTO_INCREMENT,
    employee_id      INTEGER  NOT NULL,
    customer_id      INTEGER  NOT NULL,
    sales_history_id INTEGER  NOT NULL,
    goods_id         INTEGER  NOT NULL,
    sale_price       TEXT     NOT NULL,
    cost_price       TEXT     NOT NULL,
    manufacturer     TEXT     NOT NULL,
    sale_date        DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (goods_id) REFERENCES table_goods (goods_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    FOREIGN KEY (employee_id) REFERENCES table_employees (employee_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    FOREIGN KEY (customer_id) REFERENCES table_customers (customer_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE table_sales_history
(
    sales_history_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    employee_id      INTEGER  NOT NULL,
    customer_id      INTEGER  NOT NULL,
    goods_id         INTEGER  NOT NULL,
    sale_price       TEXT     NOT NULL,
    cost_price       TEXT     NOT NULL,
    manufacturer     TEXT     NOT NULL,
    sale_date        DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (employee_id) REFERENCES table_employees (employee_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    FOREIGN KEY (customer_id) REFERENCES table_customers (customer_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    FOREIGN KEY (goods_id) REFERENCES table_goods (goods_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);