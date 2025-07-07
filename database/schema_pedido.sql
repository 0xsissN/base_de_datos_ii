CREATE DATABASE tienda_online;


CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    ciudad VARCHAR(50)
);

CREATE TABLE producto (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2),
    stock INT
);

CREATE TABLE pedido (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES cliente(id_cliente),
    fecha_pedido DATE,
    estado VARCHAR(50)
);

CREATE TABLE detalle_pedido (
    id_detalle SERIAL PRIMARY KEY,
    id_pedido INT REFERENCES pedido(id_pedido),
    id_producto INT REFERENCES producto(id_producto),
    cantidad INT,
    precio_unitario NUMERIC(10, 2)
);
