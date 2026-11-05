# Happy paths y sad paths — E-commerce "Pago de Jotrón"

En este documento recojo los recorridos principales de la tienda: **15 happy paths**, donde todo sale bien, y **15 sad paths**, donde algo falla y el sistema tiene que responder de forma controlada. Me sirven para tres cosas: comprobar que los requisitos se entienden igual desde el punto de vista del usuario, preparar los **tests E2E** con Playwright y enseñarle al cliente cómo se comporta la tienda antes de la beta.

Parto de lo que ya tengo definido:

- **Tarea 01:** el análisis de mercado y la parte legal (LSSI, RGPD y LOPDGDD, cookies y la **Ley 4/1997** de venta de alcohol a menores).
- **Tarea 02:** los requisitos funcionales y no funcionales ([`requisitos_funcionales.md`](./requisitos_funcionales.md), [`requisitos_no_funcionales.md`](./requisitos_no_funcionales.md)) y los casos de uso ([`casos_de_uso_extendido.md`](./casos_de_uso_extendido.md)).

## Criterios

- Todos los caminos son del **MVP1**, que es lo que se publica primero. Dejo fuera PayPal, la transferencia, el blog, las recomendaciones, los favoritos y las visitas y catas, porque van en el MVP2.
- Uso los datos de prueba de [`datos-bbdd.sql`](./datos-bbdd.sql): vinos de Andalucía, pasas de Málaga y precios en euros con IVA incluido.
- Cada camino indica el requisito y el caso de uso que cubre, para poder trazarlo en el backlog.
- Los sad paths no son errores de programación: son situaciones previstas en los requisitos. Lo importante es que el usuario entienda qué ha pasado y que los datos no queden a medias.

## Resumen

| Código | Happy path                                   | Código | Sad path                                         |
| ------ | -------------------------------------------- | ------ | ------------------------------------------------ |
| HP-01  | Verificar la edad al entrar                  | SP-01  | Un menor intenta entrar en la tienda             |
| HP-02  | Registrarse como cliente                     | SP-02  | Registro con un email que ya existe              |
| HP-03  | Iniciar sesión sin perder el carrito         | SP-03  | Registro de un menor saltándose la verificación  |
| HP-04  | Buscar y filtrar el catálogo                 | SP-04  | Inicio de sesión con datos incorrectos           |
| HP-05  | Consultar la ficha de un producto            | SP-05  | Búsqueda sin resultados                          |
| HP-06  | Gestionar el carrito                         | SP-06  | Abrir la ficha de un producto bloqueado          |
| HP-07  | Comprar y pagar con tarjeta                  | SP-07  | Pedir más unidades de las que hay en stock       |
| HP-08  | Seguir un pedido y descargar la factura      | SP-08  | Un anónimo intenta pagar                         |
| HP-09  | Cancelar un pedido antes de que salga        | SP-09  | La pasarela rechaza el pago                      |
| HP-10  | Gestionar las direcciones del perfil         | SP-10  | La última unidad se agota durante la compra      |
| HP-11  | Dar de alta un producto y reponer stock      | SP-11  | Cancelar un pedido fuera de plazo                |
| HP-12  | Llevar un pedido hasta Entregado             | SP-12  | Un pedido se queda parado más de 15 días         |
| HP-13  | Bloquear la venta de una bodega              | SP-13  | Un cliente intenta entrar en el panel            |
| HP-14  | Cambiar el rol de un usuario                 | SP-14  | Degradar al último administrador                 |
| HP-15  | Gestionar las cookies y leer las páginas legales | SP-15  | Desbloquear un vino con la bodega bloqueada      |

## 1. Happy paths

### HP-01 Verificar la edad al entrar

| CAMPO              | DESCRIPCIÓN                                                                                                     |
| ------------------ | --------------------------------------------------------------------------------------------------------------- |
| Actor              | Usuario anónimo                                                                                                 |
| Requisitos         | RF2, RNF7 · CU14                                                                                              |
| Precondición       | Es la primera visita y el navegador no tiene guardada la verificación.                                         |
| Pasos              | 1. Entra en la portada. 2. El sistema le pide la fecha de nacimiento. 3. Introduce 15/05/1985. 4. El sistema calcula que tiene 18 años o más. |
| Resultado esperado | Accede a la tienda y no se le vuelve a preguntar durante la sesión.                                            |

### HP-02 Registrarse como cliente

| CAMPO              | DESCRIPCIÓN                                                                                                                                       |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| Actor              | Usuario anónimo                                                                                                                                   |
| Requisitos         | RF2, RNF3 · CU1                                                                                                                                |
| Precondición       | Ha superado la verificación de edad y el email no está registrado.                                                                               |
| Pasos              | 1. Abre el registro. 2. Introduce fecha de nacimiento, email y una contraseña con mayúsculas, minúsculas y números. 3. Acepta la política de privacidad. 4. Envía el formulario. |
| Resultado esperado | Se crea una cuenta con rol **Cliente**, la contraseña se guarda con hash y le llega el correo de confirmación.                                   |

### HP-03 Iniciar sesión sin perder el carrito

| CAMPO              | DESCRIPCIÓN                                                                                                   |
| ------------------ | ------------------------------------------------------------------------------------------------------------- |
| Actor              | Usuario anónimo con cuenta de cliente                                                                         |
| Requisitos         | RF1, RF6 · CU2                                                                                             |
| Precondición       | Tiene en el carrito dos botellas de **Jotrón Tinto Roble** (9,50 €) sin haber iniciado sesión.               |
| Pasos              | 1. Pulsa "Iniciar sesión". 2. Introduce email y contraseña correctos. 3. El sistema le identifica.           |
| Resultado esperado | Entra como cliente y el carrito sigue con las dos botellas. Como el carrito es persistente, lo ve igual desde otro dispositivo. |

### HP-04 Buscar y filtrar el catálogo

| CAMPO              | DESCRIPCIÓN                                                                                                                         |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------------- |
| Actor              | Usuario anónimo o cliente                                                                                                           |
| Requisitos         | RF5, RNF4 · CU5                                                                                                                  |
| Precondición       | Hay productos activos en el catálogo.                                                                                               |
| Pasos              | 1. Entra en `/productos`. 2. Marca la denominación **DO Jerez-Xérès-Sherry**. 3. Añade un rango de precio de 10 € a 25 €. 4. Escribe "fino" en el buscador. |
| Resultado esperado | Ve solo los vinos que cumplen todo a la vez (por ejemplo, **Tío Pepe Fino**, 11,95 €), paginados y con los filtros activos visibles. |

### HP-05 Consultar la ficha de un producto

| CAMPO              | DESCRIPCIÓN                                                                                                                       |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------------- |
| Actor              | Usuario anónimo o cliente                                                                                                         |
| Requisitos         | RF4 · CU19                                                                                                                      |
| Precondición       | El producto está activo y tiene stock.                                                                                            |
| Pasos              | 1. Abre **Pasas de Málaga Jotrón** desde el catálogo. 2. Revisa la descripción, la DOP y las uvas. 3. Cambia de la presentación de 500 g a la de 1 kg. |
| Resultado esperado | La ficha muestra el precio y el stock de cada presentación (7,50 € y 13,50 €) y deja añadir al carrito la que elija.              |

### HP-06 Gestionar el carrito

| CAMPO              | DESCRIPCIÓN                                                                                                                      |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------------- |
| Actor              | Usuario anónimo o cliente                                                                                                        |
| Requisitos         | RF6 · CU4, CU15                                                                                                             |
| Precondición       | Los productos tienen stock suficiente.                                                                                           |
| Pasos              | 1. Añade **Solear Manzanilla** y **Jotrón Moscatel Dulce**. 2. Sube la manzanilla a 3 unidades. 3. Elimina el moscatel. 4. Abre el carrito. |
| Resultado esperado | El carrito muestra 3 × 9,90 € = 29,70 € y el total se actualiza en cada cambio, con IVA incluido.                                |

### HP-07 Comprar y pagar con tarjeta

| CAMPO              | DESCRIPCIÓN                                                                                                                                                                       |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Actor              | Cliente · Pasarela de pago                                                                                                                                                        |
| Requisitos         | RF7, RF8, RNF3, RNF4 · CU3                                                                                                                                                     |
| Precondición       | Sesión iniciada, edad verificada y carrito con productos en stock.                                                                                                                |
| Pasos              | 1. Pulsa "Finalizar compra". 2. Elige una dirección de Málaga guardada. 3. Selecciona **Envío estándar** (4,95 €). 4. Revisa el resumen. 5. Paga con tarjeta en la pasarela. 6. La pasarela acepta el cobro. |
| Resultado esperado | Se crea el pedido en estado **Confirmado**, el stock baja en la misma transacción, el carrito se vacía y le llega el correo. Los datos de la tarjeta no pasan por nuestro servidor. |

### HP-08 Seguir un pedido y descargar la factura

| CAMPO              | DESCRIPCIÓN                                                                                     |
| ------------------ | ----------------------------------------------------------------------------------------------- |
| Actor              | Cliente                                                                                         |
| Requisitos         | RF8 · CU8                                                                                    |
| Precondición       | Tiene un pedido en estado **Entregado**.                                                        |
| Pasos              | 1. Entra en `/cuenta/pedidos`. 2. Abre el pedido. 3. Revisa el historial de estados. 4. Pulsa "Descargar factura". |
| Resultado esperado | Ve el estado actual con sus fechas y descarga la factura en PDF con el desglose del IVA.        |

### HP-09 Cancelar un pedido antes de que salga

| CAMPO              | DESCRIPCIÓN                                                                                                       |
| ------------------ | ----------------------------------------------------------------------------------------------------------------- |
| Actor              | Cliente                                                                                                           |
| Requisitos         | RF8, RNF6 · CU7                                                                                                |
| Precondición       | El pedido está **Confirmado** o **En proceso** (aún no ha salido del almacén) y se creó hace menos de 24 horas. Si está **Pendiente de pago**, se puede cancelar en cualquier momento. |
| Pasos              | 1. Abre el pedido. 2. Pulsa "Cancelar pedido". 3. Confirma la cancelación.                                       |
| Resultado esperado | El pedido pasa a **Anulado** (por el cliente), las unidades vuelven al stock y se inicia la devolución del importe. Si estaba Pendiente de pago, no hay nada que devolver. |

### HP-10 Gestionar las direcciones del perfil

| CAMPO              | DESCRIPCIÓN                                                                                                      |
| ------------------ | ---------------------------------------------------------------------------------------------------------------- |
| Actor              | Cliente                                                                                                          |
| Requisitos         | RF3 · CU6                                                                                                     |
| Precondición       | Sesión iniciada.                                                                                                 |
| Pasos              | 1. Entra en `/cuenta/direcciones`. 2. Añade una dirección en Ronda (Málaga) con su tipo de vía. 3. La marca como dirección de envío por defecto. |
| Resultado esperado | La dirección queda guardada y aparece seleccionada en el siguiente checkout.                                     |

### HP-11 Dar de alta un producto y reponer stock

| CAMPO              | DESCRIPCIÓN                                                                                                                                    |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| Actor              | Editor                                                                                                                                         |
| Requisitos         | RF4, RF12 · CU9                                                                                                                             |
| Precondición       | Sesión iniciada con rol **Editor**. La bodega y la denominación de origen ya existen.                                                          |
| Pasos              | 1. Entra en `/admin/productos`. 2. Crea un vino de **Bodegas Alvear** con DO Montilla-Moriles, precio, presentación de 75 cl, imagen y stock. 3. Guarda. 4. Más tarde, sube su stock tras una reposición. |
| Resultado esperado | El vino aparece en la tienda con su stock y el log registra quién lo creó y quién cambió el stock.                                            |

### HP-12 Llevar un pedido hasta Entregado

| CAMPO              | DESCRIPCIÓN                                                                                                                   |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------- |
| Actor              | Administrador                                                                                                                 |
| Requisitos         | RF8, RF12 · CU11                                                                                                            |
| Precondición       | Hay un pedido en estado **Confirmado**.                                                                                       |
| Pasos              | 1. Abre el pedido en `/admin/pedidos`. 2. Lo pasa a **En proceso**, **Preparado**, **Enviado** y **Entregado** según avanza. |
| Resultado esperado | Cada cambio guarda su fecha, el cliente lo ve en su área y la factura queda disponible al llegar a Entregado.                 |

### HP-13 Bloquear la venta de una bodega

| CAMPO              | DESCRIPCIÓN                                                                                                         |
| ------------------ | ------------------------------------------------------------------------------------------------------------------- |
| Actor              | Administrador                                                                                                       |
| Requisitos         | RF4, RF12 · CU13                                                                                                  |
| Precondición       | La bodega **Emilio Lustau** tiene vinos activos y ninguno está en pedidos en curso.                                 |
| Pasos              | 1. Entra en las bodegas del panel. 2. Bloquea Emilio Lustau. 3. Comprueba la tienda.                              |
| Resultado esperado | Todos sus vinos desaparecen de los listados y no se pueden comprar, pero siguen visibles en el panel. Queda en el log. |

### HP-14 Cambiar el rol de un usuario

| CAMPO              | DESCRIPCIÓN                                                                                    |
| ------------------ | ---------------------------------------------------------------------------------------------- |
| Actor              | Administrador                                                                                  |
| Requisitos         | RF1, RF12 · CU12                                                                             |
| Precondición       | Hay un cliente que empieza a trabajar en la bodega.                                            |
| Pasos              | 1. Busca al usuario en `/admin/usuarios`. 2. Cambia su rol de **Cliente** a **Editor**. 3. Guarda. |
| Resultado esperado | En su siguiente petición el usuario ya ve el acceso al panel con los permisos de editor, y el cambio queda en el log. |

### HP-15 Gestionar las cookies y leer las páginas legales

| CAMPO              | DESCRIPCIÓN                                                                                                                          |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------ |
| Actor              | Usuario anónimo                                                                                                                      |
| Requisitos         | RF11, RNF2, RNF7                                                                                                                     |
| Precondición       | Es la primera visita.                                                                                                                |
| Pasos              | 1. Aparece el banner de cookies. 2. Pulsa "Configurar" y acepta solo las de análisis. 3. Abre la política de privacidad desde el pie. |
| Resultado esperado | Google Analytics se activa solo tras el consentimiento, la elección se recuerda y las páginas legales se leen sin iniciar sesión.    |

## 2. Sad paths

### SP-01 Un menor intenta entrar en la tienda

| CAMPO                 | DESCRIPCIÓN                                                                                        |
| --------------------- | -------------------------------------------------------------------------------------------------- |
| Actor                 | Usuario anónimo                                                                                    |
| Requisitos            | RF2, RNF7 · CU14                                                                                 |
| Pasos                 | 1. Entra en la portada. 2. Introduce una fecha de nacimiento de hace 16 años.                     |
| Qué falla             | No tiene la edad mínima para ver contenido con alcohol.                                           |
| Respuesta del sistema | Muestra un mensaje de acceso denegado y no deja entrar en el catálogo. No se guarda la verificación. |

### SP-02 Registro con un email que ya existe

| CAMPO                 | DESCRIPCIÓN                                                                                       |
| --------------------- | ------------------------------------------------------------------------------------------------- |
| Actor                 | Usuario anónimo                                                                                   |
| Requisitos            | RF2 · CU1                                                                                      |
| Pasos                 | 1. Rellena el registro con `ana.gomez@example.com`. 2. Envía el formulario.                      |
| Qué falla             | El email ya pertenece a otra cuenta.                                                              |
| Respuesta del sistema | No crea la cuenta, marca el campo del email con un mensaje claro y ofrece iniciar sesión o recuperar la contraseña. Conserva el resto de datos, salvo la contraseña. |

### SP-03 Registro de un menor saltándose la verificación

| CAMPO                 | DESCRIPCIÓN                                                                                                     |
| --------------------- | --------------------------------------------------------------------------------------------------------------- |
| Actor                 | Usuario anónimo                                                                                                 |
| Requisitos            | RF2, RNF3, RNF7 · CU1                                                                                        |
| Pasos                 | 1. Supera la verificación inicial con una fecha falsa. 2. En el registro pone su fecha real, de un menor de 17 años. |
| Qué falla             | La fecha del registro no corresponde a un mayor de edad.                                                       |
| Respuesta del sistema | El servidor valida la edad con el esquema Zod, no crea la cuenta e informa del motivo. La comprobación no depende solo del formulario. |

### SP-04 Inicio de sesión con datos incorrectos

| CAMPO                 | DESCRIPCIÓN                                                                                           |
| --------------------- | ----------------------------------------------------------------------------------------------------- |
| Actor                 | Usuario anónimo                                                                                       |
| Requisitos            | RF2, RNF3 · CU2                                                                                    |
| Pasos                 | 1. Introduce un email registrado con una contraseña errónea.                                          |
| Qué falla             | Las credenciales no coinciden.                                                                        |
| Respuesta del sistema | Muestra "Email o contraseña incorrectos", sin decir cuál de los dos falla, y ofrece el enlace para recuperar la contraseña. Si la cuenta está desactivada, también lo indica. |

### SP-05 Búsqueda sin resultados

| CAMPO                 | DESCRIPCIÓN                                                                                         |
| --------------------- | --------------------------------------------------------------------------------------------------- |
| Actor                 | Usuario anónimo o cliente                                                                           |
| Requisitos            | RF5, RNF5 · CU5                                                                                  |
| Pasos                 | 1. Filtra por **DO Granada** y tipología "Generoso". 2. Añade un precio máximo de 5 €.            |
| Qué falla             | Ningún producto cumple todos los filtros.                                                           |
| Respuesta del sistema | Muestra un mensaje claro de que no hay resultados y un botón para quitar los filtros. No aparece una página en blanco. |

### SP-06 Abrir la ficha de un producto bloqueado

| CAMPO                 | DESCRIPCIÓN                                                                                       |
| --------------------- | ------------------------------------------------------------------------------------------------- |
| Actor                 | Usuario anónimo o cliente                                                                         |
| Requisitos            | RF4 · CU19                                                                                      |
| Pasos                 | 1. Abre un enlace guardado a un vino de **Bodegas Toro Albalá**, que está bloqueada.             |
| Qué falla             | El producto está bloqueado por su bodega.                                                         |
| Respuesta del sistema | Devuelve la página de "Producto no encontrado" con un enlace al catálogo. No muestra precio ni botón de compra. |

### SP-07 Pedir más unidades de las que hay en stock

| CAMPO                 | DESCRIPCIÓN                                                                                       |
| --------------------- | ------------------------------------------------------------------------------------------------- |
| Actor                 | Usuario anónimo o cliente                                                                         |
| Requisitos            | RF4, RF6 · CU4                                                                                 |
| Pasos                 | 1. Tiene **Cortijo Los Aguilares Pinot Noir** en el carrito (18 en stock). 2. Sube la cantidad a 25. |
| Qué falla             | La cantidad supera el stock disponible.                                                           |
| Respuesta del sistema | Ajusta la cantidad al máximo disponible y avisa de cuántas unidades quedan. Si el producto llega a cero, se muestra como agotado. |

### SP-08 Un anónimo intenta pagar

| CAMPO                 | DESCRIPCIÓN                                                                                           |
| --------------------- | ----------------------------------------------------------------------------------------------------- |
| Actor                 | Usuario anónimo                                                                                       |
| Requisitos            | RF1, RF6 · CU3                                                                                     |
| Pasos                 | 1. Llena el carrito sin cuenta. 2. Pulsa "Finalizar compra".                                         |
| Qué falla             | Para comprar hay que ser cliente.                                                                     |
| Respuesta del sistema | Redirige al login con la vuelta al checkout preparada. Tras entrar o registrarse, el carrito se conserva y continúa la compra. |

### SP-09 La pasarela rechaza el pago

| CAMPO                 | DESCRIPCIÓN                                                                                                   |
| --------------------- | ------------------------------------------------------------------------------------------------------------- |
| Actor                 | Cliente · Pasarela de pago                                                                                    |
| Requisitos            | RF7, RNF5 · CU3                                                                                            |
| Pasos                 | 1. Completa el checkout. 2. Paga con una tarjeta sin saldo.                                                  |
| Qué falla             | La pasarela devuelve el pago como rechazado.                                                                  |
| Respuesta del sistema | No crea el pedido ni descuenta stock. Muestra la página de fallo con el motivo y la opción de reintentar, y el carrito se mantiene intacto. |

### SP-10 La última unidad se agota durante la compra

| CAMPO                 | DESCRIPCIÓN                                                                                                                       |
| --------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| Actor                 | Dos clientes · Pasarela de pago                                                                                                   |
| Requisitos            | RF7, RNF4, RNF6 · CU3                                                                                                          |
| Pasos                 | 1. Queda una botella de **Lustau San Emilio Pedro Ximénez**. 2. Dos clientes la tienen en el carrito y confirman casi a la vez. 3. El primero completa la compra. |
| Qué falla             | Cuando el segundo confirma, ya no hay stock.                                                                                      |
| Respuesta del sistema | No crea su pedido ni le cobra, y muestra: _"Lo sentimos, este producto se ha agotado mientras hacías la compra. Revisa tu carrito y prueba con otro producto."_ El stock nunca queda en negativo. |

### SP-11 Cancelar un pedido fuera de plazo

| CAMPO                 | DESCRIPCIÓN                                                                                          |
| --------------------- | ---------------------------------------------------------------------------------------------------- |
| Actor                 | Cliente                                                                                              |
| Requisitos            | RF8, RNF6 · CU7                                                                                   |
| Pasos                 | 1. Abre un pedido creado hace 30 horas, o uno que ya está **Preparado** o **Enviado**. 2. Intenta cancelarlo. |
| Qué falla             | Han pasado más de 24 horas o el pedido ya ha salido del almacén.              |
| Respuesta del sistema | No muestra el botón de cancelar y, si la petición llega igualmente a la API, la rechaza con el motivo. Le recuerda que tiene 14 días desde la recepción para ejercer el **derecho de desistimiento** sobre los vinos y las pasas. |

### SP-12 Un pedido se queda parado más de 15 días

| CAMPO                 | DESCRIPCIÓN                                                                                               |
| --------------------- | --------------------------------------------------------------------------------------------------------- |
| Actor                 | Sistema (tarea programada) · Administrador                                                                |
| Requisitos            | RF8, RNF4, RNF5, RNF6 · CU11                                                                            |
| Pasos                 | 1. Un pedido lleva 16 días en **Preparado**. 2. Se ejecuta la tarea diaria.                              |
| Qué falla             | El pedido ha superado los 15 días en el mismo estado.                                                    |
| Respuesta del sistema | Lo pasa a **Bloqueado**, avisa al administrador y al cliente, y el pedido no avanza hasta que se revisa. Los pedidos Entregados o Anulados no se tocan. |

### SP-13 Un cliente intenta entrar en el panel

| CAMPO                 | DESCRIPCIÓN                                                                                           |
| --------------------- | ----------------------------------------------------------------------------------------------------- |
| Actor                 | Cliente                                                                                               |
| Requisitos            | RF1, RNF3                                                                                             |
| Pasos                 | 1. Escribe `/admin/pedidos` en la barra del navegador. 2. Prueba también a llamar a `/api/admin/...`. |
| Qué falla             | Su rol no tiene permiso.                                                                              |
| Respuesta del sistema | El middleware y la API comprueban el rol en el servidor: muestra "Acceso denegado" y la API responde 403. No basta con ocultar el enlace del menú. |

### SP-14 Degradar al último administrador

| CAMPO                 | DESCRIPCIÓN                                                                                       |
| --------------------- | ------------------------------------------------------------------------------------------------- |
| Actor                 | Administrador                                                                                     |
| Requisitos            | RF12, RNF6 · CU12                                                                               |
| Pasos                 | 1. Es el único administrador. 2. Intenta cambiar su propio rol a **Editor** o desactivar su cuenta. |
| Qué falla             | La tienda se quedaría sin administrador.                                                          |
| Respuesta del sistema | Rechaza el cambio y explica que siempre debe quedar al menos un administrador. No se modifica nada. |

### SP-15 Desbloquear un vino con la bodega bloqueada

| CAMPO                 | DESCRIPCIÓN                                                                                                   |
| --------------------- | ------------------------------------------------------------------------------------------------------------- |
| Actor                 | Administrador                                                                                                 |
| Requisitos            | RF4, RF12 · CU13                                                                                            |
| Pasos                 | 1. **Bodegas Toro Albalá** está bloqueada. 2. Intenta desbloquear solo uno de sus vinos.                     |
| Qué falla             | Un vino bloqueado por su bodega no se puede desbloquear por separado.                                       |
| Respuesta del sistema | Rechaza la acción y le indica que tiene que desbloquear la bodega completa. El vino sigue fuera de la tienda. |

## Conclusión

Con estos 30 recorridos cubro las partes del MVP1 donde más se juega la tienda: la **verificación de edad**, el **flujo de compra** y el **control de stock y pedidos**. Los sad paths tienen más peso del que parece, porque son los que protegen al cliente y a la bodega: un menor que no compra, un pago rechazado que no deja un pedido a medias o una última botella que no se vende dos veces.

Además, cada camino está pensado para convertirse en un test. Los que tocan reglas de negocio (SP-10, SP-11, SP-12 y SP-14) irán como **tests unitarios** con Vitest, como pide el RNF6, y el flujo de compra completo (HP-07, SP-09 y SP-10) como **test E2E** con Playwright. Cuando cierre el MVP1, añadiré los caminos del MVP2: PayPal, transferencia, blog, recomendaciones y visitas y catas.
