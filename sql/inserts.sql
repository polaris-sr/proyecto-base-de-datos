CLIENTE (3 registros)
INSERT INTO CLIENTE VALUES ('CLI001', 'TechStore Madrid SL', 'B12345678', 'Calle Gran Vía 28, Madrid', '910123456', 'info@techstore.com', TO_DATE('2024-01-15', 'YYYY-MM-DD'));
INSERT INTO CLIENTE VALUES ('CLI002', 'Informática García', 'C87654321', 'Avenida Diagonal 123, Barcelona', '932456789', 'contacto@infogarcia.com', TO_DATE('2024-02-20', 'YYYY-MM-DD'));
INSERT INTO CLIENTE VALUES ('CLI003', 'Juan Pérez López', '12345678A', 'Plaza Mayor 5, Sevilla', '954321098', 'juan.perez@email.com', TO_DATE('2024-03-10', 'YYYY-MM-DD'));

PROVEEDOR (3 registros)
INSERT INTO PROVEEDOR VALUES ('PROV001', 'Dell Technologies', 'A11111111', 'Estados Unidos', '+1234567890', 'ventas@dell.com');
INSERT INTO PROVEEDOR VALUES ('PROV002', 'Logitech International', 'B22222222', 'Suiza', '+41123456789', 'contact@logitech.com');
INSERT INTO PROVEEDOR VALUES ('PROV003', 'Kingston Technology', 'C33333333', 'Taiwan', '+886123456789', 'info@kingston.com');

EMPLEADO (3 registros)
INSERT INTO EMPLEADO VALUES ('11111111A', 'María González Ruiz', 'Ventas', '611222333', 'maria.gonzalez@empresa.com', TO_DATE('2023-06-01', 'YYYY-MM-DD'));
INSERT INTO EMPLEADO VALUES ('22222222B', 'Carlos Martínez López', 'Compras', '622333444', 'carlos.martinez@empresa.com', TO_DATE('2023-07-15', 'YYYY-MM-DD'));
INSERT INTO EMPLEADO VALUES ('33333333C', 'Ana Fernández Sanz', 'Almacén', '633444555', 'ana.fernandez@empresa.com', TO_DATE('2023-08-20', 'YYYY-MM-DD'));

PRODUCTO (3 registros)
INSERT INTO PRODUCTO VALUES ('PROD001', 'Portátil Dell Latitude 5520', 'Portátil empresarial 15.6 pulgadas', 'Portátiles', 899.99, 10, 'PROV001');
INSERT INTO PRODUCTO VALUES ('PROD002', 'Ratón Logitech MX Master 3', 'Ratón inalámbrico ergonómico', 'Periféricos', 99.99, 25, 'PROV002');
INSERT INTO PRODUCTO VALUES ('PROD003', 'Memoria RAM Kingston 16GB DDR4', 'Memoria RAM 3200MHz', 'Componentes', 79.99, 50, 'PROV003');

PEDIDO (3 registros)
INSERT INTO PEDIDO VALUES ('PED001', TO_DATE('2024-11-01', 'YYYY-MM-DD'), 'Entregado', 'Calle Gran Vía 28, Madrid', TO_DATE('2024-11-05', 'YYYY-MM-DD'), 'CLI001', '11111111A');
INSERT INTO PEDIDO VALUES ('PED002', TO_DATE('2024-11-10', 'YYYY-MM-DD'), 'Enviado', 'Avenida Diagonal 123, Barcelona', TO_DATE('2024-11-15', 'YYYY-MM-DD'), 'CLI002', '11111111A');
INSERT INTO PEDIDO VALUES ('PED003', TO_DATE('2024-11-20', 'YYYY-MM-DD'), 'Pendiente', 'Plaza Mayor 5, Sevilla', TO_DATE('2024-11-25', 'YYYY-MM-DD'), 'CLI003', '11111111A');

COMPRA (3 registros)
INSERT INTO COMPRA VALUES ('COMP001', TO_DATE('2024-10-01', 'YYYY-MM-DD'), 'Recibida', TO_DATE('2024-10-10', 'YYYY-MM-DD'), 'PROV001');
INSERT INTO COMPRA VALUES ('COMP002', TO_DATE('2024-10-15', 'YYYY-MM-DD'), 'Recibida', TO_DATE('2024-10-20', 'YYYY-MM-DD'), 'PROV002');
INSERT INTO COMPRA VALUES ('COMP003', TO_DATE('2024-11-01', 'YYYY-MM-DD'), 'En Tránsito', TO_DATE('2024-11-10', 'YYYY-MM-DD'), 'PROV003');

PEDIDO_PRODUCTO (3 registros)
INSERT INTO PEDIDO_PRODUCTO VALUES ('PED001', 'PROD001', 2, 899.99);
INSERT INTO PEDIDO_PRODUCTO VALUES ('PED002', 'PROD002', 5, 99.99);
INSERT INTO PEDIDO_PRODUCTO VALUES ('PED003', 'PROD003', 3, 79.99);

ENTREGA (3 registros - solo para pedidos que no están pendientes)
INSERT INTO ENTREGA VALUES ('SEG001', TO_DATE('2024-11-02', 'YYYY-MM-DD'), TO_DATE('2024-11-04', 'YYYY-MM-DD'), 'SEUR', 'Entrega sin incidencias', 'PED001');
INSERT INTO ENTREGA VALUES ('SEG002', TO_DATE('2024-11-12', 'YYYY-MM-DD'), NULL, 'MRW', 'En reparto', 'PED002');

COMPRA_PRODUCTO (3 registros)
INSERT INTO COMPRA_PRODUCTO VALUES ('COMP001', 'PROD001', 20, 650.00);
INSERT INTO COMPRA_PRODUCTO VALUES ('COMP002', 'PROD002', 50, 65.00);
INSERT INTO COMPRA_PRODUCTO VALUES ('COMP003', 'PROD003', 100, 55.00);
