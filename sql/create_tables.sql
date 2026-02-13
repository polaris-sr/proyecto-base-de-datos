CREATE TABLE CLIENTE (
    cod_cliente VARCHAR2(10) PRIMARY KEY,
    nombre_razonsocial VARCHAR2(100) NOT NULL,
    cif_nif VARCHAR2(15) NOT NULL UNIQUE,
    direccion_facturacion VARCHAR2(200) NOT NULL,
    telefono VARCHAR2(15),
    email VARCHAR2(100) NOT NULL,
    fecha_alta DATE NOT NULL,
    CONSTRAINT chk_email_cliente CHECK (email LIKE '%@%')
);
CREATE TABLE PROVEEDOR (
    cod_proveedor VARCHAR2(10) PRIMARY KEY,
    nombre_empresa VARCHAR2(100) NOT NULL,
    cif VARCHAR2(15) NOT NULL UNIQUE,
    pais_origen VARCHAR2(50) NOT NULL,
    telefono VARCHAR2(15),
    email VARCHAR2(100) NOT NULL,
    CONSTRAINT chk_email_proveedor CHECK (email LIKE '%@%')
);
CREATE TABLE EMPLEADO (
    dni VARCHAR2(9) PRIMARY KEY,
    nombre_completo VARCHAR2(100) NOT NULL,
    departamento VARCHAR2(50) NOT NULL,
    telefono VARCHAR2(15),
    email VARCHAR2(100) NOT NULL,
    fecha_incorporacion DATE NOT NULL,
    CONSTRAINT chk_email_empleado CHECK (email LIKE '%@%'),
    CONSTRAINT chk_departamento CHECK (departamento IN ('Ventas', 'Compras', 'Almacén', 'IT'))
);
CREATE TABLE PRODUCTO (
    cod_producto VARCHAR2(10) PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(500),
    categoria VARCHAR2(50) NOT NULL,
    precio_venta NUMBER(10,2) NOT NULL,
    stock NUMBER(10) DEFAULT 0 NOT NULL,
    cod_proveedor VARCHAR2(10) NOT NULL,
    CONSTRAINT fk_producto_proveedor FOREIGN KEY (cod_proveedor) REFERENCES PROVEEDOR(cod_proveedor),
    CONSTRAINT chk_precio_venta CHECK (precio_venta >= 0),
    CONSTRAINT chk_stock CHECK (stock >= 0),
    CONSTRAINT chk_categoria CHECK (categoria IN ('Portátiles', 'Componentes', 'Periféricos', 'Software', 'Accesorios'))
);
CREATE TABLE PEDIDO (
    num_pedido VARCHAR2(10) PRIMARY KEY,
    fecha_pedido DATE NOT NULL,
    estado VARCHAR2(20) NOT NULL,
    direccion_envio VARCHAR2(200) NOT NULL,
    fecha_entrega_estimada DATE,
    cod_cliente VARCHAR2(10) NOT NULL,
    dni_empleado VARCHAR2(9) NOT NULL,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (cod_cliente) REFERENCES CLIENTE(cod_cliente),
    CONSTRAINT fk_pedido_empleado FOREIGN KEY (dni_empleado) REFERENCES EMPLEADO(dni),
    CONSTRAINT chk_estado_pedido CHECK (estado IN ('Pendiente', 'En Preparación', 'Enviado', 'Entregado', 'Cancelado')),
    CONSTRAINT chk_fecha_entrega CHECK (fecha_entrega_estimada >= fecha_pedido)
);
CREATE TABLE COMPRA (
    cod_compra VARCHAR2(10) PRIMARY KEY,
    fecha_compra DATE NOT NULL,
    estado VARCHAR2(20) NOT NULL,
    fecha_recepcion_estimada DATE,
    cod_proveedor VARCHAR2(10) NOT NULL,
    CONSTRAINT fk_compra_proveedor FOREIGN KEY (cod_proveedor) REFERENCES PROVEEDOR(cod_proveedor),
    CONSTRAINT chk_estado_compra CHECK (estado IN ('Solicitada', 'En Tránsito', 'Recibida')),
    CONSTRAINT chk_fecha_recepcion CHECK (fecha_recepcion_estimada >= fecha_compra)
);
CREATE TABLE PEDIDO_PRODUCTO (
    num_pedido VARCHAR2(10),
    cod_producto VARCHAR2(10),
    cantidad NUMBER(10) NOT NULL,
    precio_unitario NUMBER(10,2) NOT NULL,
    PRIMARY KEY (num_pedido, cod_producto),
    CONSTRAINT fk_pedido_producto_pedido FOREIGN KEY (num_pedido) REFERENCES PEDIDO(num_pedido),
    CONSTRAINT fk_pedido_producto_producto FOREIGN KEY (cod_producto) REFERENCES PRODUCTO(cod_producto),
    CONSTRAINT chk_cantidad_pedido CHECK (cantidad > 0),
    CONSTRAINT chk_precio_unitario CHECK (precio_unitario >= 0)
);
CREATE TABLE ENTREGA (
    num_seguimiento VARCHAR2(20) PRIMARY KEY,
    fecha_envio DATE NOT NULL,
    fecha_entrega_real DATE,
    empresa_transporte VARCHAR2(50) NOT NULL,
    observaciones VARCHAR2(500),
    num_pedido VARCHAR2(10) UNIQUE NOT NULL,
    CONSTRAINT fk_entrega_pedido FOREIGN KEY (num_pedido) REFERENCES PEDIDO(num_pedido),
    CONSTRAINT chk_fecha_entrega_real CHECK (fecha_entrega_real >= fecha_envio),
    CONSTRAINT chk_empresa_transporte CHECK (empresa_transporte IN ('MRW', 'SEUR', 'Correos', 'DHL', 'UPS'))
);
CREATE TABLE COMPRA_PRODUCTO (
    cod_compra VARCHAR2(10),
    cod_producto VARCHAR2(10),
    cantidad NUMBER(10) NOT NULL,
    precio_coste_unitario NUMBER(10,2) NOT NULL,
    PRIMARY KEY (cod_compra, cod_producto),
    CONSTRAINT fk_compra_producto_compra FOREIGN KEY (cod_compra) REFERENCES COMPRA(cod_compra),
    CONSTRAINT fk_compra_producto_producto FOREIGN KEY (cod_producto) REFERENCES PRODUCTO(cod_producto),
    CONSTRAINT chk_cantidad_compra CHECK (cantidad > 0),
    CONSTRAINT chk_precio_coste CHECK (precio_coste_unitario >= 0)
);
