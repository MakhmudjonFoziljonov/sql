-- ==============
--      1
-- ==============
CREATE TABLE customers
(
    id    SERIAL PRIMARY KEY,
    name  VARCHAR(32),
    email TEXT UNIQUE
);

CREATE TABLE orders
(
    id          SERIAL PRIMARY KEY,
    price       DECIMAL(10, 2) NOT NULL,
    date        TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    customer_id INTEGER REFERENCES customers (id) ON DELETE RESTRICT
);
-- ==============
--      2
-- ==============
CREATE TABLE departments
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(32) NOT NULL
);
CREATE TABLE employees
(
    id            SERIAL PRIMARY KEY,
    name          VARCHAR(32) NOT NULL,
    department_id INTEGER     REFERENCES departments (id) ON DELETE SET NULL
);

-- ==============
--      3
-- ==============
CREATE TABLE categories
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(32) NOT NULL
);

CREATE TABLE products
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(32) NOT NULL,
    price       DECIMAL(10, 2) CHECK (price >= 0),
    category_id INTEGER REFERENCES categories (id) ON DELETE RESTRICT
);
-- ==============
--      4
-- ==============
CREATE TABLE customers
(
    id    SERIAL PRIMARY KEY,
    name  VARCHAR(32),
    email TEXT UNIQUE
);
CREATE TABLE orders
(
    id          SERIAL PRIMARY KEY,
    price       DECIMAL(10, 2) NOT NULL,
    date        TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    customer_id INTEGER REFERENCES customers (id) ON DELETE RESTRICT
);

CREATE TABLE order_items
(
    order_id   INTEGER,
    product_id INTEGER,
    quantity   INTEGER CHECK ( quantity > 0 ),
    FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE RESTRICT,
    FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE RESTRICT,
    PRIMARY KEY (order_id, product_id)
);
-- ==============
--      5
-- ==============
CREATE TABLE students
(
    id       SERIAL PRIMARY KEY,
    name     VARCHAR(64) NOT NULL,
    group_id INTEGER REFERENCES groups (id) ON DELETE RESTRICT
);
CREATE TABLE groups
(
    id         SERIAL PRIMARY KEY,
    name       VARCHAR(64) NOT NULL,
    faculty_id INTEGER REFERENCES faculties (id) ON DELETE RESTRICT
);

CREATE TABLE faculties
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE courses
(
    id         SERIAL PRIMARY KEY,
    name       VARCHAR(32) NOT NULL,
    teacher_id INTEGER REFERENCES teachers (id) ON DELETE RESTRICT
);

CREATE TABLE teachers
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(64) NOT NULL
);

CREATE TABLE student_courses
(
    student_id INTEGER REFERENCES students (id) ON DELETE RESTRICT,
    course_id  INTEGER REFERENCES courses (id) ON DELETE RESTRICT,
    grade      INTEGER NOT NULL CHECK (grade BETWEEN 1 AND 5),
    PRIMARY KEY (student_id, course_id)
);
-- ==============
--      6
-- ==============
CREATE TABLE users
(
    id         SERIAL PRIMARY KEY,
    name       VARCHAR(32) NOT NULL,
    email      TEXT UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts
(
    id         SERIAL PRIMARY KEY,
    text       TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id    INTEGER REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE comments
(
    id         SERIAL PRIMARY KEY,
    post_id    INTEGER REFERENCES posts (id) ON DELETE CASCADE,
    user_id    INTEGER REFERENCES users (id) ON DELETE CASCADE,
    text       TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE likes
(
    user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
    post_id INTEGER REFERENCES posts (id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, post_id)

);