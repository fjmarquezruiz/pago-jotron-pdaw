# Requisitos funcionales — E-commerce "Pago de Jotrón"

En este documento recojo lo que debe hacer la aplicación, organizado por bloques. Los requisitos de seguridad, rendimiento y calidad están en `requisitos_no_funcionales.md`.

## RF1 Roles y control de acceso

El sistema tiene cuatro perfiles con permisos progresivos: cada uno incluye lo del anterior.

- **Anónimo:** se mueve por la tienda, el blog y las páginas informativas, busca y filtra productos y puede llenar el carrito. Para comprar tiene que registrarse.
- **Cliente:** compra, sigue sus pedidos y se descarga las facturas. También mantiene su perfil y sus direcciones.
- **Editor:** gestiona el catálogo, el stock, los eventos (visitas, catas) y el blog.
- **Administrador:** todo lo del editor y, además, los usuarios y sus roles, los pedidos, el bloqueo de ventas, los tipos de envío y el log de acciones.

El acceso a cada zona depende del rol. Si no se tiene permiso, se muestra un mensaje de acceso denegado. Todos los usuarios registrados pueden cerrar sesión.

## RF2 Verificación de edad, registro y autenticación

- Antes de ver contenido con alcohol, el visitante indica su fecha de nacimiento. Los menores de 18 años no pueden entrar.
- El registro pide fecha de nacimiento, email y contraseña. El email no se puede repetir.
- Hay que marcar el checkbox de aceptar la política de privacidad. El sistema comprueba que la fecha de nacimiento corresponde a una persona de 18 años o más.
- La contraseña tiene que ser segura: mínimo 8 caracteres, con mayúsculas, minúsculas y números.
- Al registrarse se crea una cuenta de **cliente** y se envía un correo de confirmación.
- Si el usuario olvida la contraseña, recibe un enlace temporal por correo para cambiarla.

## RF3 Perfil y direcciones

- El cliente puede modificar sus datos personales y gestionar sus direcciones de envío y facturación.
- El cliente puede darse de baja. La cuenta se desactiva y se anonimizan sus datos, pero los pedidos y las facturas se conservan por obligación legal. No se puede dar de baja con pedidos en curso.

## RF4 Catálogo y productos

- El catálogo muestra los productos de la bodega (vinos y pasas), los vinos de otras bodegas andaluzas y los eventos.
- Los editores y administradores pueden dar de alta, modificar y dar de baja productos, y listar y buscar en el catálogo. La baja retira el producto de la tienda pero no lo borra, para no perder el historial de pedidos.
- Cada producto tiene nombre, descripción, imagen, precio, presentación y **stock**.
- En los **vinos** se añaden la tipología, la añada, la graduación alcohólica, el envejecimiento, las temperaturas, el tamaño de la botella (presentación), las notas de cata, el maridaje, las uvas, la bodega y la denominación de origen.
- En las **pasas** se añaden el tamaño del envase (presentación), las uvas y la denominación de origen.
- Cada vino pertenece a **una sola bodega** y a **una sola denominación de origen**. En cambio, una bodega puede tener vinos en varias denominaciones de origen.
- Los editores gestionan los **valores asociados**: bodegas, denominaciones de origen, tipos de uva y tipologías.
- Un mismo producto puede tener varias **presentaciones** (vino de 75 cl o 25 cl, pasas de 1 kg o 500 g). Cada presentación es un producto independiente con su precio, stock y formato visibles en la ficha.
- Un producto sin stock aparece como agotado y no se puede añadir al carrito. Los editores y administradores actualizan el stock a mano cuando hay reposición.
- Se puede **bloquear la venta** de un producto, de una bodega o de una denominación de origen. Lo que está bloqueado no aparece en los listados de la tienda, su ficha no está disponible y no se puede comprar. Solo se ve en el panel de administración. El bloqueo funciona así:
  - Si se bloquea una **bodega**, se bloquean todos sus vinos.
  - Si se bloquea una **denominación de origen**, se bloquean todos sus vinos y pasas. Como una bodega puede trabajar con varias denominaciones, el resto de sus vinos se sigue vendiendo.
  - Un vino bloqueado por su bodega o por su denominación de origen no se puede desbloquear por separado: hay que desbloquear la bodega o la denominación de origen completa.
- Los **eventos** se tratan como productos, con fecha, hora de inicio y fin, precio, plazas, localización (por defecto la bodega de Pago de Jotrón), listado de actos, planificación del evento. Las plazas hacen de stock.

## RF5 Búsqueda y filtros

- El usuario puede filtrar los productos por una o varias características a la vez: denominación de origen, bodega, tipo de uva, tipología, precio o añada.
- La búsqueda por texto funciona sobre el nombre y la descripción.
- Si no hay resultados, se muestra un mensaje claro y la opción de quitar los filtros.

## RF6 Carrito

- Los usuarios anónimos y los clientes pueden añadir productos al carrito mientras haya stock.
- Se pueden cambiar cantidades, eliminar productos y ver el total en cualquier momento.
- El carrito de un anónimo se conserva al iniciar sesión. Para comprar hay que ser cliente.

## RF7 Compra y pago

- El proceso de compra pide los datos de envío, el tipo de envío y el método de pago, y termina con un resumen del total.
- Los métodos de pago son **tarjeta de crédito, PayPal y transferencia bancaria**. La tarjeta y PayPal se pagan a través de una pasarela externa segura y la aplicación no guarda los datos de la tarjeta.
- Con la **transferencia bancaria** no se cobra en el momento: al terminar la compra se muestran los datos de la cuenta y el pedido queda en estado **Pendiente de pago** hasta que el administrador confirma que ha recibido el importe.
- Los envíos son solo dentro de España en esta primera versión.
- Antes de cobrar se comprueba que hay stock suficiente. Si el pago con tarjeta o PayPal se acepta, se crea el pedido en estado **Confirmado** y se envía un correo al cliente. Si se rechaza, no se crea el pedido y el carrito se mantiene.
- El stock se descuenta al crear el pedido, en la misma operación. Así, **la última unidad es para el primero que completa la compra**. Si otro cliente intenta comprarla a la vez, no se crea su pedido ni se le cobra, y se le muestra un aviso: _"Lo sentimos, este producto se ha agotado mientras hacías la compra. Revisa tu carrito y prueba con otro producto."_

## RF8 Pedidos y sus estados

Cada pedido pasa por estos estados:

| Estado                | Significado                                                |
| --------------------- | ---------------------------------------------------------- |
| **Pendiente de pago** | Pedido con transferencia a la espera de recibir el importe |
| **Confirmado**        | Recibido y pagado                                          |
| **En proceso**        | Lo estamos preparando; aún no ha salido del almacén        |
| **Preparado**         | Listo para enviar                                          |
| **Enviado**           | En tránsito                                                |
| **Entregado**         | Recibido por el cliente                                    |
| **Anulado**           | Cancelado, indicando si fue el cliente o el administrador  |
| **Bloqueado**         | Pendiente de revisión                                      |

Las reglas principales son estas:

- Cuando el administrador confirma el cobro de una transferencia, el pedido pasa de **Pendiente de pago** a **Confirmado** y se envía el correo al cliente.
- El **stock** se descuenta al crear el pedido, como explico en el RF7. Si el pedido se anula, las unidades vuelven al stock.
- El cliente puede **cancelar** un pedido mientras no haya salido del almacén (estados **Confirmado** o **En proceso**) y siempre dentro de las primeras 24 horas desde su creación.
- Un pedido en **Pendiente de pago** se puede cancelar en cualquier momento, porque todavía no se ha cobrado. Las unidades vuelven al stock.
- Si un pedido lleva más de 15 días en el mismo estado (salvo Entregado o Anulado), pasa a **Bloqueado** y el administrador lo revisa.
- Al anular un pedido ya pagado se devuelve el importe al cliente.
- Los eventos no se envían: si un pedido solo contiene eventos, sin vinos ni pasas, el administrador lo pasa directamente a **Entregado** cuando se celebran.
- El cliente puede ver el estado de sus pedidos y **descargar la factura** de los pedidos **Entregados**. El administrador puede listar, buscar y cambiar el estado de cualquier pedido.

## RF9 Vinos relacionados

- La ficha de cada vino muestra vinos relacionados según el **historial de compras** del cliente: vinos de las bodegas, denominaciones de origen y tipologías que más compra.
- Si el cliente no tiene historial (es nuevo o no ha iniciado sesión), se muestran vinos de la misma bodega, denominación de origen o tipología que el vino que está viendo. Si no hay suficientes, se completa con una **selección aleatoria**.
- Nunca se recomienda el propio vino, ni productos bloqueados o agotados.

## RF10 Blog

- Cualquier visitante puede leer los artículos publicados y filtrarlos por categoría.
- Los editores y administradores pueden crear, modificar, publicar, despublicar y eliminar artículos.
- Los artículos se pueden asociar a vinos, bodegas, categorías de vino (tipologías) o denominaciones de origen, y aparecen como **contenido relacionado** en las fichas de los vinos. Si un vino no tiene artículos, se muestran algunos al azar.

## RF11 Páginas informativas y legales

- La portada presenta la bodega y da acceso al catálogo, al blog y a los eventos.
- Hay **páginas informativas** de la bodega (historia, contacto y preguntas frecuentes) y **páginas legales**: aviso legal, política de privacidad, política de cookies, condiciones de compra y devoluciones.
- Son **páginas estáticas**: su contenido va en el código y no se edita desde el panel. Cambian muy poco y los textos legales conviene revisarlos antes de publicarlos, así que no compensa montar un editor.
- Cualquier usuario puede consultarlas desde la portada o el pie de página, sin iniciar sesión.

## RF12 Administración avanzada

- El administrador puede listar y buscar usuarios, desactivarlos y cambiar su rol. Solo él puede cambiar roles y siempre debe quedar al menos un administrador: no se puede eliminar ni degradar al último.
- Puede **bloquear las ventas** de productos, bodegas o denominaciones de origen, con las reglas del RF4. Si afecta a pedidos en curso, el sistema pide confirmación.
- Gestiona los tipos de envío (nombre y coste), por ejemplo estándar, exprés y recogida en bodega.
- El sistema guarda un **log de acciones** de los usuarios con permisos de gestión (quién, qué y cuándo). Solo el administrador puede consultarlo.

## RF13 Interfaz y navegación

La aplicación tiene estas pantallas: portada, registro e inicio de sesión, catálogo con filtros, ficha de producto, carrito, checkout, perfil, mis pedidos, blog, páginas informativas y panel de administración. El menú principal se ve en todas y el acceso al panel solo aparece a editores y administradores. La interfaz es responsive y accesible, como detallo en los requisitos no funcionales.

## Resumen

Con estos requisitos la aplicación cubre lo que pide el cliente: vender los productos de la bodega y de otras bodegas andaluzas, gestionar los pedidos y el stock, y que la propia bodega pueda mantener el catálogo y el blog sin depender de nadie. Lo que más me va a costar, creo, es el control del stock cuando dos clientes compran la última unidad a la vez y la verificación de la edad.
