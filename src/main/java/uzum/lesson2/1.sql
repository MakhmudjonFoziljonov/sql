-- ==============
--      1
-- ==============
CREATE TABLE products
(
    id    SERIAL PRIMARY KEY,
    name  VARCHAR(32) NOT NULL,
    price INTEGER     NOT NULL
);

CREATE TABLE customers
(
    id    SERIAL PRIMARY KEY,
    name  VARCHAR(32) NOT NULL,
    email TEXT        NOT NULL UNIQUE
);

CREATE TABLE orders
(
    id          SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES customers (id) ON DELETE RESTRICT,
    product_id  INTEGER NOT NULL REFERENCES products (id) ON DELETE RESTRICT
);

-- ==============
--      2
-- ==============
CREATE TABLE order_items
(
    order_id   INTEGER,
    product_id INTEGER,
    quantity   INTEGER,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE RESTRICT,
    FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE RESTRICT
);

-- ==============
--      3
-- ==============
CREATE TABLE customers
(
    id     SERIAL PRIMARY KEY,
    name   VARCHAR(32) NOT NULL,
    city   VARCHAR(32) NOT NULL ,
    region VARCHAR(32) NOT NULL
);


