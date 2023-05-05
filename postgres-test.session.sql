DROP TABLE messages;

CREATE TABLE messages(
    id serial PRIMARY KEY,
    body text NOT NULL CHECK (body != ''),
    author varchar(256) NOT NULL CHECK (author != ''),
    created_at timestamp DEFAULT current_timestamp,
    is_read boolean DEFAULT false
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

CREATE TABLE a(
    b int,
    c int,
    CONSTRAINT "unique_pair" PRIMARY KEY (b,c)
);

INSERT INTO a VALUES
(1,1),
(1,2),
(2,3),
(1,3);