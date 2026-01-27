--EJERCICIO 1

CREATE TABLE users (
    id INT GENERATED ALWAYS AS IDENTITY,
    email VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_users PRIMARY KEY (id),
    CONSTRAINT uq_email UNIQUE (email)
);

INSERT INTO users (email)
VALUES ('email1@example.com'),
       ('email2@example.com');

DROP TABLE users;

