
CREATE TABLE students (

    student_id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_code TEXT UNIQUE NOT NULL,
    title TEXT NOT NULL,
    credits INT NOT NULL CHECK (credits BETWEEN 1 AND 10)
);

CREATE TABLE professors (
    professor_id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE course_professors (
    course_id INT NOT NULL,
    professor_id INT NOT NULL,
    PRIMARY KEY (course_id, professor_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE,
    FOREIGN KEY (professor_id) REFERENCES professors(professor_id) ON DELETE RESTRICT
);

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolled_at DATE NOT NULL DEFAULT CURRENT_DATE,
    grade NUMERIC(4,2) CHECK (grade BETWEEN 0 AND 100),
    UNIQUE (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

INSERT INTO students (full_name, email) VALUES
                                            ('Ana López','ana.lopez@email.com'),
                                            ('Carlos Pérez','carlos.perez@email.com'),
                                            ('María Gómez','maria.gomez@email.com'),
                                            ('Luis Hernández','luis.hernandez@email.com'),
                                            ('Jorge Castillo','jorge.castillo@email.com'),
                                            ('Laura Torres','laura.torres@email.com'),
                                            ('Miguel Ramos','miguel.ramos@email.com'),
                                            ('Sofía Morales','sofia.morales@email.com'),
                                            ('Daniel Cruz','daniel.cruz@email.com'),
                                            ('Paola Fernández','paola.fernandez@email.com'),
                                            ('Ricardo Vega','ricardo.vega@email.com'),
                                            ('Fernanda Ruiz','fernanda.ruiz@email.com'),
                                            ('Iván Soto','ivan.soto@email.com'),
                                            ('Lucía Navarro','lucia.navarro@email.com'),
                                            ('Héctor Flores','hector.flores@email.com'),
                                            ('Andrea Molina','andrea.molina@email.com'),
                                            ('Pedro Salas','pedro.salas@email.com'),
                                            ('Valeria Ríos','valeria.rios@email.com'),
                                            ('Oscar Medina','oscar.medina@email.com'),
                                            ('Camila Ortega','camila.ortega@email.com'),
                                            ('Raúl Pineda','raul.pineda@email.com'),
                                            ('Natalia Fuentes','natalia.fuentes@email.com'),
                                            ('Sergio León','sergio.leon@email.com'),
                                            ('Mariana Campos','mariana.campos@email.com'),
                                            ('Emilio Vázquez','emilio.vazquez@email.com'),
                                            ('Karla Núñez','karla.nunez@email.com'),
                                            ('Diego Álvarez','diego.alvarez@email.com'),
                                            ('Patricia Cordero','patricia.cordero@email.com'),
                                            ('Tomás Beltrán','tomas.beltran@email.com'),
                                            ('Renata Silva','renata.silva@email.com');
INSERT INTO courses (course_code, title, credits) VALUES
                                                      ('CS101','Introduction to Programming',5),
                                                      ('DB201','Databases I',4),
                                                      ('AL301','Algorithms',6),
                                                      ('OS210','Operating Systems',5),
                                                      ('NW150','Computer Networks',4),
                                                      ('SE400','Software Engineering',6),
                                                      ('WD120','Web Development',4),
                                                      ('DS330','Data Structures',5);
INSERT INTO professors (full_name, email) VALUES
                                              ('Dr. Juan Martínez','juan.martinez@uni.edu'),
                                              ('Dra. Sofía Ramírez','sofia.ramirez@uni.edu'),
                                              ('Dr. Andrés Luna','andres.luna@uni.edu'),
                                              ('Dra. Elena Paredes','elena.paredes@uni.edu'),
                                              ('Dr. Pablo Méndez','pablo.mendez@uni.edu'),
                                              ('Dra. Claudia Rojas','claudia.rojas@uni.edu');
INSERT INTO course_professors (course_id, professor_id) VALUES
                                                            (1,1),(2,2),(3,1),(4,3),
                                                            (5,3),(6,4),(7,5),(8,6),
                                                            (2,4),(6,2),(8,1),(7,3);
INSERT INTO enrollments (student_id, course_id, grade) VALUES
                                                           (1,1,85),(1,2,90),(1,3,78),
                                                           (2,1,70),(2,4,75),
                                                           (3,2,88),(3,3,92),(3,6,91),
                                                           (4,1,NULL),(4,5,68),
                                                           (5,2,73),(5,4,80),
                                                           (6,1,95),(6,3,89),(6,6,93),
                                                           (7,5,77),(7,7,82),
                                                           (8,4,84),(8,8,88),
                                                           (9,6,90),(9,3,85),
                                                           (10,3,91),(10,2,86),
                                                           (11,2,NULL),(11,7,74),
                                                           (12,1,79),(12,8,83),
                                                           (13,5,81),(13,4,76),
                                                           (14,6,88),(14,3,84),
                                                           (15,7,90),(15,1,72),
                                                           (16,2,87),(16,8,91),
                                                           (17,4,69),(17,5,73),
                                                           (18,6,94),(18,3,89),
                                                           (19,1,65),(19,2,70),
                                                           (20,8,88),(20,7,85),
                                                           (21,6,92),(21,4,81),
                                                           (22,3,90),(22,1,78),
                                                           (23,2,84),(23,5,80),
                                                           (24,6,86),(24,8,90);
