DROP TABLE messages;

CREATE TABLE messages(
    id serial PRIMARY KEY,
    body text NOT NULL CHECK (body != ''),
    created_at timestamp DEFAULT current_timestamp,
    isREAD boolean NOT NULL,
    author_id int,
    chat_id int,
    FOREIGN KEY (author_id, chat_id) REFERENCES chats_to_users(chat_id, user_id)
);

INSERT INTO messages VALUES ('Hello', 'Me');

INSERT INTO messages (author,body) VALUES
('My', 'Hello again'),
('Myself', 'And again'),
('And I', 'Not again'),
('My', 'Murrr');

INSERT INTO messages VALUES (
    2, 'Text', 'author'
);

/* primary key on two column*/


-- CREATE TABLE a(
--     b int,
--     c int,
--     CONSTRAINT "unique_pair" PRIMARY KEY (b,c)
-- );

-- INSERT INTO a VALUES
-- (1,1),
-- (1,2),
-- (2,3),
-- (1,3);

/* ALTER */
DROP TABLE products;

CREATE TABLE products (
    id serial PRIMARY KEY,
    brand varchar(200) NOT NULL,
    model varchar(300) NOT NULL,
    description text,
    category varchar(200) NOT NULL,
    price numeric(10,2) NOT NULL CHECK (price > 0),
    discounted_price numeric (10,2) CHECK(discounted_price <= 0)
);

-- CREATE TABLE books (
--     id serial PRIMARY KEY,
--     author varchar(256),
--     name varchar(256),
--     year varchar(4),
--     publisher varchar(256),
--     category varchar(256),
--     synopsys text,
--     quantity int,
--     status varchar(100)
-- );

-- ALTER TABLE books
-- ADD CONSTRAINT "quantity_more_zero" CHECK (quantity >=0);

-- ALTER TABLE books
-- ADD CONSTRAINT "author_name_unique" CHECK ( author != '' AND name != '') UNIQUE (author, name);

CREATE TABLE orders (
    id serial PRIMARY KEY,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    customer_id int REFERENCES users(id)
);

CREATE TABLE users (
    id serial PRIMARY KEY,
    first_name varchar(64) NOT NULL,
    last_name varchar(64) NOT NULL,
    email text NOT NULL CHECK (email != '') UNIQUE,
    gender varchar(30),
    is_subscribe boolean NOT NULL,
    birthday date CHECK (birthday < current_date),
    foot_size smallint,
    height numeric(3, 2) CONSTRAINT too_high_user CHECK (height < 3.0)
);
DROP TABLE orders_to_products;

CREATE TABLE orders_to_products (
    order_id int REFERENCES orders(id),
    product_id int REFERENCES products(id),
    quantity int,
    PRIMARY KEY(order_id, product_id)
);

CREATE TABLE chats (
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL,
    owner_id int REFERENCES users(id),
    created_at timestamp DEFAULT current_timestamp
);

CREATE TABLE chats_to_users(
    chat_id int REFERENCES chats(id),
    user_id int REFERENCES users(id),
    join_at timestamp DEFAULT current_timestamp,
    PRIMARY KEY(chat_id, user_id)
);
