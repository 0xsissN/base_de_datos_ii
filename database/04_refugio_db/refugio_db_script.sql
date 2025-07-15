CREATE DATABASE refugio_db;
-- Tabla de refugios
CREATE TABLE refugio (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion TEXT,
    telefono VARCHAR(20)
);

-- Tabla de animales
CREATE TABLE animal (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    especie VARCHAR(50),
    raza VARCHAR(100),
    fecha_ingreso DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_adopcion DATE,
    estado VARCHAR(20) DEFAULT 'en refugio',
    id_refugio INT REFERENCES refugio(id) NOT NULL
);

-- Tabla de adoptantes
CREATE TABLE adoptante (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ci VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion TEXT
);

-- Tabla de adopciones
CREATE TABLE adopcion (
    id SERIAL PRIMARY KEY,
    id_animal INT UNIQUE REFERENCES animal(id) NOT NULL,
    id_adoptante INT REFERENCES adoptante(id) NOT NULL,
    fecha_adopcion DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Tabla de enfermedades
CREATE TABLE enfermedad (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla de enfermedades por animal
CREATE TABLE animal_enfermedad (
    id SERIAL PRIMARY KEY,
    id_animal INT REFERENCES animal(id) NOT NULL,
    id_enfermedad INT REFERENCES enfermedad(id) NOT NULL,
    fecha_diagnostico DATE NOT NULL DEFAULT CURRENT_DATE,
    observaciones TEXT
);

-- Tabla de vacunas
CREATE TABLE vacuna (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla de vacunaciones por animal
CREATE TABLE animal_vacuna (
    id SERIAL PRIMARY KEY,
    id_animal INT REFERENCES animal(id) NOT NULL,
    id_vacuna INT REFERENCES vacuna(id) NOT NULL,
    fecha_aplicacion DATE NOT NULL DEFAULT CURRENT_DATE,
    dosis VARCHAR(20)
);

-- Tabla de seguimientos
CREATE TABLE seguimiento (
    id SERIAL PRIMARY KEY,
    id_animal INT REFERENCES animal(id) NOT NULL,
    fecha DATE NOT NULL DEFAULT CURRENT_DATE,
    descripcion TEXT NOT NULL,
    realizado_por VARCHAR(100)
);

-- Tabla de reportes
CREATE TABLE reporte (
    id SERIAL PRIMARY KEY,
    id_animal INT REFERENCES animal(id) NOT NULL,
    tipo VARCHAR(50),
    descripcion TEXT,
    fecha_reporte DATE DEFAULT CURRENT_DATE
);
