CREATE TABLE t1 (
    id SERIAL PRIMARY KEY,
    nombre varchar(50) NOT NULL,
    email varchar(50)  NOT NULL,
    fecha_registro date DEFAULT CURRENT_DATE,

    CONSTRAINT uq_email UNIQUE (email)
);

SELECT * FROM t1;

INSERT INTO t1(nombre, email)
VALUES('migue','correomigue@aol.com'),
      ('victor','correovictor@aol.com');


DROP TABLE t1;

