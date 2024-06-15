CREATE DATABASE sistema_soporte;
USE sistema_soporte;

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    email VARCHAR(100),
    veces_utilizada INT DEFAULT 1
);

CREATE TABLE Operario (
    id_operario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    email VARCHAR(100),
    veces_solicitado INT DEFAULT 1
);

CREATE TABLE Soporte (
    id_soporte INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    evaluacion INT,
    id_operario INT,
    id_usuario INT,
    FOREIGN KEY (id_operario) REFERENCES Operario(id_operario),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);


INSERT INTO Usuario (nombre, apellido, edad, email, veces_utilizada)
VALUES
    ('Juan', 'Perez', 30, 'juan@gmail.com', 1),
    ('María', 'García', 25, 'maria@gmail.com', 1),
    ('Pedro', 'Sánchez', 35, 'pedro@gmail.com', 1),
    ('Laura', 'López', 28, 'laura@gmail.com', 1),
    ('Carlos', 'Martínez', 32, 'carlos@gmail.com', 1);


INSERT INTO Operario (nombre, apellido, edad, email, veces_solicitado)
VALUES
    ('Luis', 'González', 27, 'luis@soporte.com', 1),
    ('Ana', 'Ramírez', 30, 'ana@soporte.com', 1),
    ('Jorge', 'Díaz', 26, 'jorge@soporte.com', 1),
    ('Elena', 'Hernández', 29, 'elena@soporte.com', 1),
    ('Mario', 'Ruiz', 31, 'mario@soporte.com', 1);

INSERT INTO Soporte (fecha, evaluacion, id_operario, id_usuario)
VALUES
    ('2024-06-01', 7, 1, 1),
    ('2024-06-02', 6, 2, 2),
    ('2024-06-03', 5, 3, 3),
    ('2024-06-04', 7, 4, 4),
    ('2024-06-05', 4, 5, 5),
    ('2024-06-06', 7, 1, 2),
    ('2024-06-07', 6, 2, 3),
    ('2024-06-08', 6, 3, 4),
    ('2024-06-09', 5, 4, 5),
    ('2024-06-10', 7, 5, 1);

SELECT * FROM Soporte ORDER BY evaluacion DESC LIMIT 3;

SELECT * FROM Soporte ORDER BY evaluacion ASC LIMIT 3;

SELECT Operario.id_operario, Operario.nombre, Operario.apellido, COUNT(*) AS total_soportes
FROM Soporte
JOIN Operario ON Soporte.id_operario = Operario.id_operario
GROUP BY Operario.id_operario, Operario.nombre, Operario.apellido
ORDER BY total_soportes DESC
LIMIT 1;

SELECT id_usuario, nombre, apellido, veces_utilizada
FROM Usuario
ORDER BY veces_utilizada ASC
LIMIT 1;

UPDATE Usuario SET edad = edad + 10 ORDER BY id_usuario LIMIT 3;

ALTER TABLE Usuario CHANGE COLUMN email email VARCHAR(100);
ALTER TABLE Operario CHANGE COLUMN email email VARCHAR(100);

SELECT * FROM Operario WHERE edad > 20;


