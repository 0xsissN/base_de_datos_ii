CREATE DATABASE plataforma;
--DROP DATABASE plataforma;

CREATE TABLE persona(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ci VARCHAR(20) UNIQUE NOT NULL,
    apellido_paterno VARCHAR(100),
    apellido_materno VARCHAR(100),
    fecha_nacimiento DATE NOT NULL
);

CREATE TABLE rol (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE usuario (
    id INT REFERENCES persona(id) PRIMARY KEY,
    email VARCHAR(150) UNIQUE NOT NULL,
    nombre_usuario VARCHAR(50) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    fecha_registro TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE usuario_rol (
    usuario_id INT REFERENCES usuario(id),
    rol_id INT REFERENCES rol(id),
    PRIMARY KEY (usuario_id, rol_id)
);

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    descripcion VARCHAR(1000),
    docente_id INT REFERENCES usuario(id),
    fecha_creacion TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(20) DEFAULT 'activo' CHECK (estado IN ('activo', 'inactivo'))
);

CREATE TABLE curso_categoria (
    curso_categoria_id SERIAL PRIMARY KEY,
    curso_id INT REFERENCES curso(id),
    categoria_id INT REFERENCES categoria(id)
);

CREATE TABLE modulo (
    id SERIAL PRIMARY KEY,
    curso_id INT REFERENCES curso(id),
    titulo VARCHAR(200) NOT NULL,
    descripcion VARCHAR(1000),
    orden INT NOT NULL
);

CREATE TABLE tarea (
    id SERIAL PRIMARY KEY,
    modulo_id INT REFERENCES modulo(id),
    titulo VARCHAR(200) NOT NULL,
    descripcion VARCHAR(1000),
    fecha_entrega TIMESTAMPTZ NOT NULL
);

CREATE TABLE inscripcion (
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuario(id),
    curso_id INT REFERENCES curso(id),
    fecha_inscripcion TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(20) DEFAULT 'inscrito' CHECK (estado IN ('inscrito', 'completado', 'cancelado'))
);

CREATE TABLE entrega (
    id SERIAL PRIMARY KEY,
    tarea_id INT REFERENCES tarea(id),
    usuario_id INT REFERENCES usuario(id),
    fecha_entrega TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    puntaje DECIMAL(5,2),
    comentario VARCHAR(1000)
);

CREATE TABLE calificacion (
    id  SERIAL PRIMARY KEY,
    entrega_id INT REFERENCES entrega(id),
    calificacion DECIMAL(5,2) CHECK (calificacion BETWEEN 0 AND 100),
    fecha_calificacion TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    evaluador_id INT8 REFERENCES usuario(id)
);

CREATE TABLE comentario (
    id SERIAL PRIMARY KEY,
    curso_id INT REFERENCES curso(id),
    usuario_id INT REFERENCES usuario(id),
    contenido VARCHAR(1000) NOT NULL,
    fecha TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE certificado (
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuario(id),
    curso_id INT REFERENCES curso(id),
    fecha_emision TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    descripcion VARCHAR(255)
);