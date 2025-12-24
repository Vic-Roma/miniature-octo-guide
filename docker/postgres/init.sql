CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    name varchar(40) NOT NULL,
    task varchar(255)
);

INSERT INTO members(name)
VALUES ('Meche'),
        ('Victor'),
        ('Wendy'),
        ('Migue'),
        ('Lalo');

CREATE TABLE tasks (
    id_task SERIAL PRIMARY KEY,
    description varchar(255) NOT NULL,
<<<<<<< Updated upstream:docker/postgres/init.sql
    asignee int REFERENCES members(id)
=======
    asignee int REFERENCES empleado(id)
>>>>>>> Stashed changes:src/db/init.sql
);

INSERT INTO tasks(description,asignee)
VALUES('lavar platos',1),
      ('Escombrar sala', 2),
      ('limpiar cocina',5),
      ('Dar comida a gatos',4),
      ('Limpiar taller',3),
      ('Lavar Camioneta',1),
      ('Limpiar bano',2),
      ('Acomodar Sillones', 4),
      ('Asear perritas',5);

SELECT * FROM members;
SELECT * FROM tasks;

DROP TABLE tasks;