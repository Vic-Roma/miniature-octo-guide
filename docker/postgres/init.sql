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
    asignee int REFERENCES members(id)
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

CREATE OR REPLACE PROCEDURE get_members_starting_with_m(
    IN p_limit INT DEFAULT 10,
    INOUT p_result REFCURSOR DEFAULT 'members_m_cursor'
)
LANGUAGE plpgsql
AS $$
BEGIN
    OPEN p_result FOR
        SELECT id, name, task
        FROM members
        WHERE name ILIKE 'm%'
        ORDER BY name
        LIMIT p_limit;
END;
$$;
