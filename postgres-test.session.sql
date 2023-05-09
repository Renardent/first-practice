DROP TABLE contents;

CREATE TABLE contents (
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL,
    description text,
    author_id int REFERENCES users(id),
    created_at timestamp DEFAULT current_timestamp
);

CREATE TABLE reactions(
    content_id int REFERENCES contents(id),
    user_id int REFERENCES users(id),
    isLiked boolean
);

INSERT INTO contents (name, author_id) VALUES
('funny dogs', 2);

INSERT INTO reactions VALUES (
    1,2,false
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