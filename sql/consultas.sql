CONSULTA 1: PRODUCTO CON STOCK BAJO
SELECT nombre, stock
FROM PRODUCTO
WHERE stock < 20;

CONSULTA 2: Listado de Pedidos con Información del Cliente
SELECT p.num_pedido,        
       c.nombre_razonsocial AS cliente,        
       p.fecha_pedido,        
       p.estado 
FROM PEDIDO p 
JOIN CLIENTE c ON p.cod_cliente = c.cod_cliente;

CONSULTA 3: Cálculo del Importe Total por Pedido
SELECT pp.num_pedido,
       SUM(pp.cantidad * pp.precio_unitario) AS total_pedido
FROM PEDIDO_PRODUCTO pp
GROUP BY pp.num_pedido;

CONSULTA 4: Total Gastado por Cliente
SELECT c.nombre_razonsocial,
       SUM(pp.cantidad * pp.precio_unitario) AS total_gastado
FROM CLIENTE c
JOIN PEDIDO p ON c.cod_cliente = p.cod_cliente
JOIN PEDIDO_PRODUCTO pp ON p.num_pedido = pp.num_pedido
GROUP BY c.nombre_razonsocial;

CONSULTA 5: Total de Compras por Proveedor
SELECT pr.nombre_empresa,
       SUM(cp.cantidad * cp.precio_coste_unitario) AS total_compras
FROM PROVEEDOR pr
JOIN COMPRA c ON pr.cod_proveedor = c.cod_proveedor
JOIN COMPRA_PRODUCTO cp ON c.cod_compra = cp.cod_compra
GROUP BY pr.nombre_empresa;
