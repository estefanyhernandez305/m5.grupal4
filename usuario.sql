CREATE DATABASE usuario;

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    zona_horaria VARCHAR(10) DEFAULT 'UTC-3',
    género CHAR(1),
    telefono_contacto VARCHAR(15)
);

CREATE TABLE ingresos (
    id_ingreso INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    fecha_hora_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE visitas (
    id_visita INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    cantidad_visitas INT DEFAULT 0,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

INSERT INTO usuarios (nombre, apellido, contraseña, zona_horaria, género, telefono_contacto)
VALUES
('Juan', 'Pérez', 'encrypted_password1', 'UTC-3', 'M', '123456789'),
('Ana', 'López', 'encrypted_password2', 'UTC-3', 'F', '987654321'),
('Carlos', 'García', 'encrypted_password3', 'UTC-3', 'M', '456123789'),
('María', 'Martínez', 'encrypted_password4', 'UTC-3', 'F', '321456987'),
('Luis', 'Gómez', 'encrypted_password5', 'UTC-3', 'M', '654789321'),
('Elena', 'Sánchez', 'encrypted_password6', 'UTC-3', 'F', '789123654'),
('Miguel', 'Ramírez', 'encrypted_password7', 'UTC-3', 'M', '147258369'),
('Lucía', 'Fernández', 'encrypted_password8', 'UTC-3', 'F', '258369147');

INSERT INTO ingresos (id_usuario)
VALUES
(1), (2), (3), (4), (5), (6), (7), (8);

INSERT INTO visitas (id_usuario, cantidad_visitas)
VALUES
(1, 10), (2, 20), (3, 15), (4, 30), (5, 5), (6, 25), (7, 8), (8, 12);

DROP TABLE visitas;

CREATE TABLE contactos (
    id_contacto INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    numero_telefono VARCHAR(15),
    correo_electronico VARCHAR(100),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
ALTER TABLE usuarios DROP COLUMN telefono_contacto;

INSERT INTO contactos (id_usuario, numero_telefono, correo_electronico)
SELECT id_usuario, '123456789', NULL FROM usuarios WHERE nombre = 'Juan' AND apellido = 'Pérez';

INSERT INTO contactos (id_usuario, numero_telefono, correo_electronico)
SELECT id_usuario, '987654321', NULL FROM usuarios WHERE nombre = 'Ana' AND apellido = 'López';

INSERT INTO contactos (id_usuario, numero_telefono, correo_electronico)
SELECT id_usuario, '456123789', NULL FROM usuarios WHERE nombre = 'Carlos' AND apellido = 'García';

INSERT INTO contactos (id_usuario, numero_telefono, correo_electronico)
SELECT id_usuario, '321456987', NULL FROM usuarios WHERE nombre = 'María' AND apellido = 'Martínez';

INSERT INTO contactos (id_usuario, numero_telefono, correo_electronico)
SELECT id_usuario, '654789321', NULL FROM usuarios WHERE nombre = 'Luis' AND apellido = 'Gómez';

INSERT INTO contactos (id_usuario, numero_telefono, correo_electronico)
SELECT id_usuario, '789123654', NULL FROM usuarios WHERE nombre = 'Elena' AND apellido = 'Sánchez';

INSERT INTO contactos (id_usuario, numero_telefono, correo_electronico)
SELECT id_usuario, '147258369', NULL FROM usuarios WHERE nombre = 'Miguel' AND apellido = 'Ramírez';

INSERT INTO contactos (id_usuario, numero_telefono, correo_electronico)
SELECT id_usuario, '258369147', NULL FROM usuarios WHERE nombre = 'Lucía' AND apellido = 'Fernández';