CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    name varchar(40) NOT NULL,
    task varchar(255)
);

INSERT INTO empleados
VALUES (1,'migue');

INSERT INTO empleados (name)
VALUES('lalo');

INSERT INTO empleados(name)
VALUES ('Meche'),
        ('Victor'),
        ('Wendy');

SELECT * FROM empleados;

DROP TABLE empleados;




CREATE TABLE task (
    id_task SERIAL PRIMARY KEY,
    description varchar(255) NOT NULL  ,
    asignee int REFERENCES empleados(id)
);



INSERT INTO task(description,asignee)
VALUES('lavar platos',1),
      ('Escombrar sala', 2),
      ('limpiar cocina',5),
      ('Dar comida a gatos',4),
      ('Limpiar taller',3),
      ('Lavar Camioneta',1),
      ('Limpiar bano',2),
      ('Acomodar Sillones', 4);

SELECT * FROM task;

SELECT * FROM task
WHERE asignee = 2;


DROP TABLE task;
