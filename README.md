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
 ![https://github.com/polaris-sr/proyecto-base-de-datos/blob/29a05a417ada0bd3671d4dbc16c4f5f668315762/diagrama_E-R.PNG]
 ## 3. Modelo Relacional

Tras diseñar el diagrama Entidad-Relación en draw.io, el siguiente paso fue "aterrizar" esas ideas al Modelo Relacional. Mi objetivo aquí fue transformar los conceptos abstractos en una estructura de tablas real que pudiera funcionar en una base de datos como Oracle. Cada entidad del diagrama E/R se tradujo a tablas con columnas, tipos de datos y restricciones:

- `CLIENTE`  

- `PRODUCTO`  

- `PROVEEDOR`  

- `PEDIDO`  

- `PEDIDO_PRODUCTO`  

- `EMPLEADO`  

- `ENTREGA`  

- `COMPRA`  

- `COMPRA_PRODUCTO`  

> ¿Cómo estructuré la información?
Para que el sistema de TechSupply Solutions fuera eficiente y no tuviera errores de duplicidad (normalización), dividí la base de datos en tres bloques clave:

Ventas y Clientes: Creé las tablas CLIENTE, PEDIDO y DETALLE_PEDIDO. Un punto importante aquí es que separé los "pedidos" de los "productos" mediante una tabla intermedia. Esto permite que un cliente compre varios productos en un solo ticket y, sobre todo, me permite guardar el precio unitario en el momento de la compra, por si el precio del catálogo sube o baja en el futuro.

Logística y Empleados: Cada pedido está vinculado a un EMPLEADO (quien lo gestiona) y puede tener una ENTREGA. He configurado la relación de entrega para que sea opcional, ya que un pedido recién creado aún no tiene datos de envío.

Compras y Stock: Para que la empresa no se quede sin material, incluí las tablas PROVEEDOR, COMPRA y COMPRA_PRODUCTO. Así se puede controlar qué le compramos a quién y cuándo recibimos la mercancía.

Reglas y Restricciones (Integridad)
No basta con crear las tablas, hay que asegurarse de que los datos sean correctos. Por eso apliqué:

Claves Primarias y Foráneas: Para que todas las tablas estén conectadas correctamente y no existan, por ejemplo, pedidos de un cliente que no existe.

Restricciones NOT NULL: Para obligar a que datos críticos (como el CIF o el email) se rellenen siempre.

Checks de Validación: Añadí reglas sencillas pero necesarias, como que el stock nunca sea negativo o que el precio siempre sea mayor que cero.  




