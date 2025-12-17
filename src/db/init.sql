-- Family Manager Database Initialization Script
-- This script creates tables and initial data for managing family members and tasks

-- Drop tables if they exist (for clean reinitialization)
DROP TABLE IF EXISTS task CASCADE;
DROP TABLE IF EXISTS empleados CASCADE;

-- Create empleados (family members) table
CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    task VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create task table with foreign key constraint
CREATE TABLE task (
    id_task SERIAL PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    asignee INTEGER NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_asignee FOREIGN KEY (asignee) 
        REFERENCES empleados(id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- Create indexes for better query performance
CREATE INDEX idx_task_asignee ON task(asignee);
CREATE INDEX idx_task_status ON task(status);

-- Insert family members
INSERT INTO empleados (name) VALUES
    ('migue'),
    ('lalo'),
    ('Meche'),
    ('Victor'),
    ('Wendy');

-- Insert tasks with assignments
INSERT INTO task (description, asignee) VALUES
    ('lavar platos', 1),
    ('Escombrar sala', 2),
    ('limpiar cocina', 5),
    ('Dar comida a gatos', 4),
    ('Limpiar taller', 3),
    ('Lavar Camioneta', 1),
    ('Limpiar bano', 2),
    ('Acomodar Sillones', 4);
