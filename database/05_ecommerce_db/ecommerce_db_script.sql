-- CREATE DATABASE ecommerce_db;
-- Tabla 1: Cliente
SELECT * from cliente

CREATE TABLE cliente (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    correo_electronico VARCHAR(150) UNIQUE,
    telefono VARCHAR(20),
    fecha_registro DATE DEFAULT CURRENT_DATE
);

-- Tabla 2: Dirección (envío o facturación)
CREATE TABLE direccion (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES cliente(id),
    direccion TEXT,
    ciudad VARCHAR(100),
    departamento VARCHAR(100),
    pais VARCHAR(100),
    tipo VARCHAR(20) CHECK (tipo IN ('envío', 'facturación'))
);

-- Tabla 3: Administrador
CREATE TABLE administrador (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    correo_electronico VARCHAR(100) UNIQUE,
    contrasena VARCHAR(100)
);

-- Tabla 4: Categoría
CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE
);

-- Tabla 5: Producto
CREATE TABLE producto (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(200),
    descripcion TEXT,
    precio DECIMAL(10,2),
    stock INT,
    categoria_id INT REFERENCES categoria(id),
    administrador_id INT REFERENCES administrador(id)
);

-- Tabla 6: Descuento
CREATE TABLE descuento (
    id SERIAL PRIMARY KEY,
    producto_id INT REFERENCES producto(id),
    porcentaje DECIMAL(5,2),
    fecha_inicio DATE,
    fecha_fin DATE,
    administrador_id INT REFERENCES administrador(id)
);

-- Tabla 7: Pedido
CREATE TABLE pedido (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES cliente(id),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(20) CHECK (estado IN ('pendiente', 'pagado', 'cancelado')),
    total DECIMAL(10,2)
);

-- Tabla 8: Detalle del pedido
CREATE TABLE detalle_pedido (
    id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedido(id),
    producto_id INT REFERENCES producto(id),
    cantidad INT,
    precio_unitario DECIMAL(10,2)
);

-- Tabla 9: Pago
CREATE TABLE pago (
    id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedido(id),
    fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    metodo_pago VARCHAR(50),
    monto DECIMAL(10,2)
);

-- Tabla 10: Envío
CREATE TABLE envio (
    id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedido(id),
    direccion_envio TEXT,
    fecha_envio TIMESTAMP,
    estado_envio VARCHAR(50)
);

-- Tabla 11: Comentario de producto
CREATE TABLE comentario (
    id SERIAL PRIMARY KEY,
    producto_id INT REFERENCES producto(id),
    cliente_id INT REFERENCES cliente(id),
    comentario TEXT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    puntaje INT CHECK (puntaje BETWEEN 1 AND 5)
);

-- Tabla 12: Cupón
CREATE TABLE cupon (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(50) UNIQUE,
    descripcion TEXT,
    descuento_porcentaje DECIMAL(5,2),
    fecha_inicio DATE,
    fecha_fin DATE,
    administrador_id INT REFERENCES administrador(id)
);

-- Tabla 13: Cupón utilizado
CREATE TABLE cupon_utilizado (
    id SERIAL PRIMARY KEY,
    cupon_id INT REFERENCES cupon(id),
    cliente_id INT REFERENCES cliente(id),
    pedido_id INT REFERENCES pedido(id),
    fecha_uso TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla 14: Lista de deseos
CREATE TABLE lista_deseos (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES cliente(id),
    producto_id INT REFERENCES producto(id),
    fecha_agregado TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
