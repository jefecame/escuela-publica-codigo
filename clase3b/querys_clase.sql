-- CREAR UNA BASE DE DATOS
CREATE DATABASE agenda;

-- CREAR UNA TABLA SIMPLE
CREATE TABLE contactos (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	telefono VARCHAR(10) NOT NULL,
	correo VARCHAR(50)
);

-- Agregar registros
INSERT INTO contactos (nombre, telefono, correo) 
VALUES ('Juan Pérez', '5551001234', 'juan@gmail.com');

INSERT INTO contactos (nombre, telefono, correo) 
VALUES 
('Ana López', '5552001234', 'ana@gmail.com'),
('Peter Parker', '6662001234', 'peter@gmail.com'),
('Bruce Banner', '9992001234', 'hulk@gmail.com');

-- Listar registros
SELECT * FROM contactos;

SELECT nombre, telefono FROM contactos;

SELECT * FROM contactos WHERE telefono = '5551001234';

-- Modificar un registro
UPDATE contactos SET telefono = '5552004567' WHERE id = 5;

-- Eliminar un registro
DELETE FROM contactos WHERE id = 5;


-- ROLES Y PERMISOS
-- Crear roles
CREATE ROLE lector LOGIN PASSWORD 'lector123';
CREATE ROLE editor LOGIN PASSWORD 'editor123';

-- Dar permiso solo de lectura al rol "lector"
GRANT CONNECT ON DATABASE agenda TO lector;
GRANT USAGE ON SCHEMA public TO lector;
GRANT SELECT ON contactos TO lector;

-- Dar permiso solo de lectura al rol "editor"
GRANT CONNECT ON DATABASE agenda TO editor;
GRANT USAGE ON SCHEMA public TO editor;
GRANT USAGE, SELECT ON SEQUENCE contactos_id_seq TO editor;
GRANT SELECT, INSERT, UPDATE, DELETE ON contactos TO editor;

-- Quitar permisos de DELETE al editor
REVOKE DELETE ON contactos FROM editor;

-- Consultas para el rol "lector" - "editor"
-- Listar registros
SELECT * FROM contactos;

-- Agregar registros
INSERT INTO contactos (nombre, telefono, correo) 
VALUES ('Ismael SL', '1231231234', 'isma@gmail.com');

-- Eliminar un registro
DELETE FROM contactos WHERE id = 7;


