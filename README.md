# proyecto-base-de-datos
"Proyecto de práctica: diseño E/R, modelo relacional y SQL para gestión de pedidos."
##Enunciado del proyecto
### Contexto
La empresa TechSupply Solutions S.L., dedicada a la distribución de material informático, necesita modernizar su sistema de gestión. Actualmente trabajan con hojas de Excel y documentos dispersos, lo que genera errores y pérdidas de información. Como persona en prácticas de DAW, te han asignado la tarea de diseñar e implementar una base de datos relacional que centralice toda la información de clientes, productos, pedidos y proveedores.

### Situación
Tu supervisor te ha convocado a una reunión donde te explica lo siguiente:

*"Necesitamos que diseñes una base de datos desde cero para nuestro sistema de gestión comercial. He recopilado los requisitos del departamento de ventas y compras. Aquí te detallo lo que necesitamos:"*

### Requisitos

**Clientes:** Guardar código único, nombre/razón social, CIF/NIF, dirección de facturación, teléfono, email y fecha de alta.  

**Productos:** Guardar código único, nombre, descripción, categoría (Portátiles, Componentes, Periféricos, Software, etc.), precio de venta actual y stock disponible.  

**Proveedores:** Cada producto tiene un solo proveedor, pero un proveedor puede suministrar varios productos. Guardar código único, nombre de la empresa, CIF, país de origen, teléfono y email.  

**Pedidos:** Guardar número único, fecha del pedido, estado (Pendiente, En Preparación, Enviado, Entregado, Cancelado), dirección de envío y fecha estimada de entrega. Un cliente puede realizar múltiples pedidos; cada pedido pertenece a un único cliente.  

**Empleados:** Cada pedido es gestionado por un único empleado; un empleado puede gestionar múltiples pedidos. Guardar DNI, nombre completo, departamento (Ventas, Compras, Almacén, IT), teléfono, email y fecha de incorporación.  

**Detalle de pedidos:** Cada pedido puede contener varios productos y un mismo producto puede estar en diferentes pedidos. Registrar cantidad y precio unitario en el momento de la compra.  

**Entregas:** Guardar número de seguimiento, fecha de envío, fecha de entrega real, empresa de transporte y observaciones opcionales. Cada pedido puede tener una o ninguna entrega asociada.  

**Compras a proveedores:** Guardar código único, fecha, estado (Solicitada, En Tránsito, Recibida) y fecha estimada de recepción. Una compra se realiza a un único proveedor; cada compra contiene varios productos con cantidad y precio de coste unitario.
## 2. Diagrama E/R

Se incluye el diagrama conceptual que representa todas las entidades y relaciones, incluyendo cardinalidades y participaciones.
![Diagrama E/R](diagramas/diagrama_E-R.png)
