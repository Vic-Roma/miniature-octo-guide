-- CREATE TABLE users (
--     id SERIAL,
--     name VARCHAR(255),
--     email VARCHAR(255),
--     date_registered DATE DEFAULT CURRENT_DATE,
--
--     CONSTRAINT pk_users_id PRIMARY KEY (id),
--     CONSTRAINT uq_users_email UNIQUE( email)
-- );
--
-- -- CREATE TABLE productos (
-- --     producto_id SERIAL,
-- --     nombre varchar(255) NOT NULL,
-- --     precio numeric(10,2) NOT NULL,
-- --     stock int DEFAULT 0,
-- --
-- --     CONSTRAINT pk_productos PRIMARY KEY (producto_id),
-- --     CONSTRAINT check_precio CHECK (precio >= 0),
-- --     CONSTRAINT check_stock CHECK (stock >= 0)
-- -- );
--
-- -- CREATE TABLE categorias (
-- --     id_categoria INT GENERATED ALWAYS AS IDENTITY,
-- --     nombre VARCHAR(255) NOT NULL,
-- --     descripcion VARCHAR(255),
-- --
-- --     CONSTRAINT pk_categorias_id PRIMARY KEY(id_categoria),
-- --     CONSTRAINT uq_categorias_nombre UNIQUE(nombre)
-- -- );
--
--
--
--
-- CREATE TABLE departamentos(
--     id_departamento INT GENERATED ALWAYS AS IDENTITY,
--     nombre VARCHAR(255) NOT NULL,
--
--     CONSTRAINT pk_departamentos PRIMARY KEY(id_departamento),
--     CONSTRAINT uq_departamentos_nombre UNIQUE(nombre)
-- );
--
-- CREATE TABLE empleados(
--     id_empleado INT GENERATED ALWAYS AS IDENTITY,
--     nombre VARCHAR(255) NOT NULL,
--     id_departamento INT NOT NULL,
--
--     CONSTRAINT  pk_empleados PRIMARY KEY(id_empleado),
--     CONSTRAINT fk_empleados FOREIGN KEY(id_departamento)
--         REFERENCES departamentos(id_departamento)
--         ON DELETE RESTRICT
-- );
--
-- SELECT * FROM empleados;
-- DROP TABLE empleados;
--
-- -- CREATE TABLE categorias (
-- --     id_categoria INT GENERATED ALWAYS AS IDENTITY,
-- --     nombre VARCHAR(255) NOT NULL,
-- --
-- --     CONSTRAINT pk_categoria PRIMARY KEY(id_categoria),
-- --     CONSTRAINT uq_categoria_nombre UNIQUE(nombre)
-- -- );
-- --
-- -- CREATE TABLE productos(
-- --     id_producto INT GENERATED ALWAYS AS IDENTITY,
-- --     nombre VARCHAR(255) NOT NULL,
-- --     precio numeric(10,2) NOT NULL,
-- --     id_categoria INT,
-- --
-- --     CONSTRAINT pk_productos PRIMARY KEY(id_producto),
-- --     CONSTRAINT chk_productos_precio CHECK(precio >= 0),
-- --     CONSTRAINT fk_productos_categorias
-- --         FOREIGN KEY(id_categoria)
-- --         REFERENCES categorias(id_categoria)
-- --         ON DELETE SET NULL
-- --         ON UPDATE CASCADE
-- --
-- -- );
-- --
-- -- DROP TABLE productos;
-- -- DROP TABLE categorias;
--
-- -- CREATE TABLE pedidos(
-- --     id_pedido INT GENERATED ALWAYS AS IDENTITY,
-- --     fecha DATE DEFAULT CURRENT_DATE,
-- --
-- --     CONSTRAINT pk_pedidos PRIMARY KEY (id_pedido)
-- -- );
-- --
-- -- CREATE TABLE pedido_detalle (
-- --     id_pedido INT NOT NULL,
-- --     id_producto INT NOT NULL,
-- --     cantidad INT,
-- --
-- --     CONSTRAINT chk_cantidad CHECK(cantidad>0),
-- --     CONSTRAINT pk_pedido_producto PRIMARY KEY(id_pedido, id_producto),
-- --     CONSTRAINT fk_id_pedido FOREIGN KEY (id_pedido)
-- --         REFERENCES pedidos(id_pedido)
-- --         ON DELETE CASCADE
-- --         ON UPDATE CASCADE
-- --
-- -- )
-- --
--
-- -- CREATE TABLE categorias(
-- --     id_categoria INT GENERATED ALWAYS AS IDENTITY,
-- --     nombre VARCHAR(255) NOT NULL,
-- --
-- --     CONSTRAINT pk_categorias PRIMARY KEY (id_categoria),
-- --     CONSTRAINT uq_nombre UNIQUE(nombre)
-- -- );
-- --
-- -- CREATE TABLE productos
-- -- (
-- --     id_producto INT GENERATED ALWAYS AS IDENTITY,
-- --     nombre      VARCHAR(255) NOT NULL,
-- --     precio numeric(10,2) NOT NULL,
-- --     id_categoria INT
-- -- ,
-- --
-- --     CONSTRAINT pk_productos PRIMARY KEY(id_producto),
-- --     CONSTRAINT chk_productos_precio CHECK(precio > 0),
-- --     CONSTRAINT fk_productos_sucursales
-- --         FOREIGN KEY(id_categoria)
-- --         REFERENCES categorias(id_categoria)
-- --         ON DELETE SET NULL
-- --         ON UPDATE CASCADE
-- --
-- -- );
--
-- -- CREATE TABLE pedidos(
-- --     id_pedido INT GENERATED ALWAYS AS IDENTITY,
-- --     fecha DATE DEFAULT CURRENT_DATE,
-- --
-- --     CONSTRAINT pk_pedido PRIMARY KEY (id_pedido)
-- -- );
-- --
-- -- CREATE TABLE pedido_producto(
-- --     id_pedido INT NOT NULL,
-- --     id_producto INT NOT NULL,
-- --     cantidad INT NOT NULL,
-- -- e
-- --     CONSTRAINT pk_pedido_producto PRIMARY KEY(id_pedido,id_producto),
-- --     CONSTRAINT chk_pedido_producto_cantidad CHECK(cantidad > 0),
-- --     CONSTRAINT fk_id_pedido_producto_pedido
-- --         FOREIGN KEY (id_pedido)
-- --         REFERENCES pedidos(id_pedido)
-- --         ON DELETE CASCADE
-- --         ON UPDATE CASCADE,
-- --     CONSTRAINT fk_id_pedido_producto_producto
-- --         FOREIGN KEY (id_producto)
-- --         REFERENCES productos(id_producto)
-- --         ON DELETE CASCADE
-- --         ON UPDATE CASCADE
-- --
-- --
-- -- );
--
-- CREATE TABLE usuarios
-- (
--     id_usuario          INT GENERATED ALWAYS AS IDENTITY,
--     nombre              VARCHAR(255) NOT NULL,
--     correo              VARCHAR(255) NOT NULL,
--     estado              VARCHAR(8) DEFAULT 'ACTIVO',
--     fecha_creacion      TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
--     fecha_actualizacion TIMESTAMP,
--
--     CONSTRAINT pk_usuarios PRIMARY KEY (id_usuario),
--     CONSTRAINT uq_usuarios_correo UNIQUE (correo),
--     CONSTRAINT chk_usuarios_estado CHECK (estado = 'ACTIVO' OR estado = 'INACTIVO')
-- )
--
-- )

-- --EJERCICIO 1 ------------------------------
--
-- CREATE TABLE roles(
--                       id_rol INT GENERATED ALWAYS AS IDENTITY,
--                       nombre_rol VARCHAR(255) NOT NULL,
--
--                       CONSTRAINT pk_roles PRIMARY KEY (id_rol),
--                       CONSTRAINT uq_roles_nombre_rol UNIQUE (nombre_rol)
-- );
--
-- CREATE TABLE usuarios(
--                          id_usuario INT GENERATED ALWAYS AS IDENTITY,
--                          nombre VARCHAR(255) NOT NULL,
--                          edad INT,
--                          id_rol INT NOT NULL,
--
--                          CONSTRAINT pk_usuarios PRIMARY KEY (id_usuario),
--                          CONSTRAINT chk_usuarios_edad CHECK(edad > 0 AND  edad <99),
--                          CONSTRAINT fk_usuarios_roles FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
--
-- );
--
-- --FIN EJERCICIO 1 ------------------------------
-- --EJERCICIO 2 ------------------------------
--
-- CREATE TABLE categorias(
--                            id_categoria INT GENERATED ALWAYS AS IDENTITY,
--                            nombre VARCHAR(255) NOT NULL,
--
--                            CONSTRAINT pk_categorias PRIMARY KEY (id_categoria),
--                            CONSTRAINT uq_categorias_nombre UNIQUE (nombre)
-- );
--
-- CREATE TABLE productos(
--                           id_producto INT GENERATED ALWAYS AS IDENTITY,
--                           nombre VARCHAR(255) NOT NULL,
--                           id_categoria INT,
--
--                           CONSTRAINT pk_productos PRIMARY KEY(id_producto),
--                           CONSTRAINT fk_productos_categorias
--                               FOREIGN KEY (id_categoria)
--                                   REFERENCES categorias(id_categoria)
--                                   ON DELETE SET NULL
--
-- );
--
-- --FIN EJERCICIO 2 ------------------------------
-- ----EJERCICIO 3 --------------------------------
--
-- CREATE TABLE clientes (
--                           id_clientes INT GENERATED ALWAYS AS IDENTITY,
--                           nombre VARCHAR(255) NOT NULL,
--                           correo VARCHAR(255) NOT NULL,
--
--                           CONSTRAINT pk_clientes PRIMARY KEY (id_clientes),
--                           CONSTRAINT uq_correo UNIQUE (correo)
-- );
--
-- CREATE TABLE direcciones (
--                              id_direccion INT GENERATED ALWAYS AS IDENTITY,
--                              ubicacion VARCHAR(255) NOT NULL,
--                              id_clientes INT NOT NULL,
--
--                              CONSTRAINT pk_direcciones PRIMARY KEY (id_direccion),
--                              CONSTRAINT fk_direcciones_clientes
--                                  FOREIGN KEY (id_clientes)
--                                      REFERENCES clientes(id_clientes)
--                                      ON DELETE CASCADE
-- );
--
--
--
--



--- EJERCICIO 1 --
CREATE TABLE Clientes(
    id_cliente INT GENERATED ALWAYS AS IDENTITY,
    nombre VARCHAR(255) NOT NULL,
    correo VARCHAR(255) NOT NULL,
    edad INT,

    CONSTRAINT uq_correo UNIQUE (correo),
    CONSTRAINT chk_edad CHECK(edad > 0 AND edad < 99),
    CONSTRAINT pk_clientes PRIMARY KEY (id_cliente)
);

CREATE TABLE Pedidos(
    id_pedido INT GENERATED ALWAYS AS IDENTITY,
    fecha DATE DEFAULT CURRENT_DATE,
    id_cliente INT NOT NULL,

    CONSTRAINT chk_fecha  CHECK (fecha IS NOT NULL),
    CONSTRAINT pk_pedidos PRIMARY KEY (id_pedido),
    CONSTRAINT fk_pedidos_clientes FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

INSERT INTO Clientes (nombre,correo,edad)
VALUES ('NOMBRE1' , 'CORREO1',23),
       ('NOMBRE2' , 'CORREO2',23),
       ('NOMBRE3' , 'CORREO3',23),
       ('NOMBRE4' , 'CORREO4',23),
       ('NOMBRE5' , 'CORREO5',23);


