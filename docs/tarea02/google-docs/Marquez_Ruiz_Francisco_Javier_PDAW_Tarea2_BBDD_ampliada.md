# **Tarea 2\. Análisis y diseño del proyecto**

**E-commerce de la Bodega Pago de Jotrón**

Francisco Javier Márquez Ruiz · Proyecto de Desarrollo de Aplicaciones Web (PDAW) · Curso 2026/27

**Índice**

\[Insertar índice automático: Insertar \> Índice \> Con enlaces azules\]

# **Introducción**

En esta tarea analizo y diseño la tienda online de la **Bodega Pago de Jotrón**, situada en el Parque Natural Montes de Málaga. La tienda vende sus vinos, sus pasas y sus visitas y catas, además de vinos de otras bodegas de Andalucía. También incluye un blog, páginas informativas y un panel para que la bodega gestione todo sin depender de nadie.

El cliente es la propia bodega. Por eso parto de lo que me ha pedido en las reuniones y lo convierto en requisitos, casos de uso, pantallas y una base de datos. Sigo el orden del enunciado, y todos los apartados usan la misma numeración de requisitos (RF y RNF) para que se puedan seguir de uno a otro.

Esta versión del documento recoge la ampliación de la base de datos que sale de revisar los formularios del panel de administración en Figma. Los cambios están en el apartado 5 y en los casos de uso CU1, CU3, CU7 y CU9, y el anexo final resume qué otros casos de uso cambian. Los scripts y diagramas nuevos están en docs/extended.

# **1\. Documento de análisis de requisitos**

La bodega quiere vender por internet sin intermediarios y gestionar ella misma el catálogo, los pedidos y los contenidos. Primero separo los requisitos funcionales de los no funcionales y después planifico el proyecto.

## **1.1 Requisitos funcionales**

| Id | Requisito | Qué debe hacer la aplicación |
| :---- | :---- | :---- |
| **RF1** | Roles y control de acceso | Cuatro perfiles con permisos progresivos: anónimo, cliente, editor y administrador. El acceso a cada zona depende del rol. |
| **RF2** | Verificación de edad, registro y autenticación | Fecha de nacimiento obligatoria: no entran menores de 18 años. Registro con email único y contraseña segura, y recuperación de contraseña por correo. |
| **RF3** | Perfil y direcciones | El cliente edita sus datos, gestiona sus direcciones de envío y facturación y puede darse de baja. Sus datos se anonimizan, pero se conservan pedidos y facturas. |
| **RF4** | Catálogo y productos | Vinos, pasas y eventos con presentaciones, stock y valores asociados (bodegas, denominaciones de origen, uvas y tipologías). Se puede bloquear la venta de un producto, una bodega o una denominación de origen. |
| **RF5** | Búsqueda y filtros | Filtros combinables (denominación, bodega, uva, tipología, precio y añada) y búsqueda por texto. |
| **RF6** | Carrito | Para anónimos y clientes, con control de stock. El carrito del anónimo se conserva al iniciar sesión. |
| **RF7** | Compra y pago | Checkout con tipo de envío (solo España) y pago con tarjeta, PayPal o transferencia a través de una pasarela segura. El stock se descuenta al crear el pedido, así que la última unidad es para quien completa antes la compra. |
| **RF8** | Pedidos y sus estados | Ocho estados: Pendiente de pago, Confirmado, En proceso, Preparado, Enviado, Entregado, Anulado y Bloqueado. El cliente puede cancelar en cualquier momento si está Pendiente de pago, o dentro de las primeras 24 horas si está Confirmado o En proceso. Un pedido parado 15 días pasa a Bloqueado. Facturas descargables de los pedidos entregados. |
| **RF9** | Vinos relacionados | La ficha del vino sugiere otros según el historial de compras del cliente. Sin historial, muestra vinos de la misma bodega, denominación o tipología. |
| **RF10** | Blog | Artículos con categorías, asociados a vinos, bodegas, tipologías y denominaciones. Los gestionan editores y administradores. |
| **RF11** | Páginas informativas y legales | Portada, historia, contacto, aviso legal, privacidad, cookies y condiciones de compra. Son páginas estáticas: el texto va en el código y no se edita desde el panel. |
| **RF12** | Administración avanzada | Gestión de usuarios y roles (siempre queda un administrador), bloqueos de venta, tipos de envío y log de acciones. |
| **RF13** | Interfaz y navegación | Pantallas de tienda, cuenta y panel con un menú común. La interfaz es responsive y accesible. |

## **1.2 Requisitos no funcionales**

| Id | Requisito | Condición |
| :---- | :---- | :---- |
| **RNF1** | Restricciones técnicas | Aplicación web con Next.js 14, TypeScript y Tailwind CSS, base de datos MySQL/MariaDB con Drizzle ORM, login y roles con NextAuth y validación en el servidor con Zod. Trabajo con Scrum y los diseños se aprueban en Figma antes de programarlos. La justificación de cada tecnología está en el apartado 2\. |
| **RNF2** | Interfaces externas | Pasarela de pago aislada en su propio módulo (Stripe para tarjeta en el MVP1), correo SMTP, navegadores actuales y Google Analytics solo con las cookies aceptadas. |
| **RNF3** | Seguridad | Contraseñas con hash, HTTPS, protección frente a inyección SQL, XSS y CSRF, permisos comprobados en el servidor y datos de tarjeta fuera de nuestro servidor (PCI DSS). |
| **RNF4** | Rendimiento y disponibilidad | Las páginas cargan en menos de 3 segundos con una conexión 4G y la tienda está disponible el 99,5 % del mes. Listados paginados, imágenes optimizadas, copia de seguridad diaria y stock y pedido en una sola transacción. |
| **RNF5** | Control de errores | Mensajes claros, resultado visible de cada acción, log de errores y ningún pedido pagado sin registrar. |
| **RNF6** | Calidad | Código separado en capas (interfaz, API y lógica de negocio), documentado y con sangría correcta. Tests unitarios de las reglas de negocio y tests E2E del flujo de compra. Accesibilidad **WCAG 2.1 AA** y URLs claras para el SEO. |
| **RNF7** | Cumplimiento legal y privacidad | **LSSI**, **RGPD** y **LOPDGDD**, banner de cookies, derecho de desistimiento de 14 días (salvo visitas y catas) y ninguna venta de alcohol a menores de 18 años. |

Las tres leyes de RNF7 son la **Ley 34/2002, de 11 de julio, de servicios de la sociedad de la información y de comercio electrónico (LSSI)**, el **Reglamento (UE) 2016/679 General de Protección de Datos (RGPD)** y la **Ley Orgánica 3/2018, de 5 de diciembre, de Protección de Datos Personales y garantía de los derechos digitales (LOPDGDD)**.

## **1.3 Planificación del proyecto**

### **Alcance**

Divido el proyecto en dos entregas. Así llego a la publicación con lo imprescindible bien hecho y probado.

| Iteración | Qué incluye |
| :---- | :---- |
| **MVP1** (semana 16\) | Registro, login, roles y verificación de edad. Catálogo, búsqueda y filtros. Carrito y pago con tarjeta. Pedidos, estados y facturas. Páginas legales y cookies. Panel de administración y log de acciones. |
| **MVP2** (tras la revisión de los 3 meses) | PayPal y transferencia, blog, recomendaciones por historial y visitas y catas. |

La verificación de edad, las cookies y las páginas legales van en el MVP1 porque las exige la ley. Quedan fuera del alcance la app móvil nativa, otros idiomas, los envíos fuera de España y la conexión con programas de contabilidad.

### **Coste**

El cliente ha aprobado **4.900 € (IVA incluido)** para el MVP1. Incluye el desarrollo y el diseño (3.500 € \+ IVA) y el primer año de hosting, dominio y correo. El desglose está en el apartado 2\.

### **Viabilidad técnica**

El proyecto es viable con los medios que tengo. Uso tecnologías libres que ya conozco del ciclo, el servidor en la nube se contrata en el día y la pasarela de pago me evita certificar yo mismo los pagos con tarjeta. El mayor riesgo es el plazo, así que lo controlo con la división en MVP1 y MVP2 y con la revisión del cliente al final de cada sprint.

### **Cronograma**

Trabajo con **sprints de dos semanas**, envío un informe semanal al cliente y nos reunimos en persona al cierre de cada sprint. En total son **16 semanas**, unos cuatro meses.

| Fase | S1 | S2 | S3 | S4 | S5 | S6 | S7 | S8 | S9 | S10 | S11 | S12 | S13 | S14 | S15 | S16 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| *Sprint* | 1 | 1 | 2 | 2 | 3 | 3 | 4 | 4 | 5 | 5 | 6 | 6 | 7 | 7 | 8 | 8 |
| 1\. Requisitos y alcance | ■ | ■ |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 2\. Diseño UX/UI (Figma) |  |  | ■ | ■ |  |  |  |  |  |  |  |  |  |  |  |  |
| 3\. Entorno y modelo de datos |  |  |  | ■ | ■ |  |  |  |  |  |  |  |  |  |  |  |
| 4\. Lógica de negocio y API |  |  |  |  |  | ■ | ■ | ■ | ■ |  |  |  |  |  |  |  |
| 5\. Frontend (tienda y panel) |  |  |  |  |  |  |  | ■ | ■ | ■ | ■ | ■ |  |  |  |  |
| 6\. Pruebas |  |  |  |  |  |  |  |  |  |  |  |  | ■ | ■ |  |  |
| 7\. Beta y aprobación |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ■ |  |
| 8\. Publicación y seguimiento |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | ■ |

*Figura 1\. Diagrama de Gantt del MVP1 (S \= semana).*

| Fase | Semanas | Entregable |
| :---- | :---- | :---- |
| 1\. Requisitos y alcance | 1-2 | Requisitos aprobados |
| 2\. Diseño UX/UI (Figma) | 3-4 | Prototipo aprobado por el cliente |
| 3\. Entorno y modelo de datos | 4-5 | Base de datos y migraciones |
| 4\. Lógica de negocio y API | 6-9 | Reglas de negocio y API |
| 5\. Frontend (tienda y panel) | 8-12 | Tienda responsive, checkout y panel |
| 6\. Pruebas | 13-14 | Tests unitarios y pruebas de compra |
| 7\. Beta y aprobación | 15 | Beta aprobada por el cliente |
| 8\. Publicación y seguimiento | 16 | MVP1 publicado |

Algunas fases se solapan a propósito. Por ejemplo, empiezo el frontend en la semana 8, cuando la API del catálogo ya está lista, y no espero a cerrar toda la lógica de negocio.

**En resumen**, el MVP1 sirve para vender y gestionar, y el MVP2, para vender más y atraer público.

# **2\. Necesidades hardware, software y de personal. Presupuesto**

## **2.1 Hardware**

| Recurso | Detalles | Coste |
| :---- | :---- | :---- |
| Equipo de desarrollo | Portátil Intel Core i7 (o equivalente), 16 GB de RAM y SSD | 0 € (ya lo tengo) |
| Móvil para pruebas responsive | Smartphone propio | 0 € (ya lo tengo) |
| Servidor de producción | Servidor en la nube, 4 vCPU, 8 GB de RAM y 512 GB SSD | Incluido en el hosting anual |

El servidor no lo compro: lo alquilo en la nube. Elijo **4 vCPU y 8 GB de RAM** porque tiene que atender varias visitas a la vez sin ir lento, sobre todo en Navidad. El disco SSD de 512 GB deja sitio para la base de datos, los logs y las copias de seguridad diarias de 30 días. Las imágenes no ocupan disco, porque van en Cloudinary.

## **2.2 Software**

En la propuesta del proyecto mezclaba tecnologías con herramientas. Ahora las separo: primero van las seis tecnologías que forman parte de la aplicación y después las herramientas con las que trabajo.

| Tecnología | Versión | Web de descarga | Coste |
| :---- | :---- | :---- | :---- |
| Next.js | 14.2 | [nextjs.org](https://nextjs.org) | 0 € |
| TypeScript | 5.3 | [typescriptlang.org](https://www.typescriptlang.org) | 0 € |
| Tailwind CSS | 3.4 | [tailwindcss.com](https://tailwindcss.com) | 0 € |
| MySQL / MariaDB | 8.4 LTS / 10.11 LTS | [mysql.com](https://www.mysql.com) y [mariadb.org](https://mariadb.org) | 0 € |
| Drizzle ORM | 0.45 | [orm.drizzle.team](https://orm.drizzle.team) | 0 € |
| NextAuth y Zod | 4.24 / 3.22 | [next-auth.js.org](https://next-auth.js.org) y [zod.dev](https://zod.dev) | 0 € |

Next.js ya trae **React 18** y funciona sobre **Node.js 22 LTS**, así que no los cuento como tecnologías aparte. El servidor irá con **Ubuntu Server 24.04 LTS**. Escojo versiones LTS porque reciben parches de seguridad durante más tiempo.

**Por qué elijo cada una:**

> * **Next.js 14:** tengo el frontend y la API en un solo proyecto, lo que me ahorra mantener dos. Además, el renderizado en servidor ayuda al **SEO** del catálogo.  
> * **TypeScript:** comparto los tipos entre el front y la API. Esto evita errores en las partes delicadas, como los estados del pedido y el stock.  
> * **Tailwind CSS:** me deja pasar los diseños de Figma a código rápido y hacer la tienda responsive sin escribir CSS a mano.  
> * **MySQL/MariaDB:** los datos de una tienda son relacionales (usuarios, pedidos, líneas, stock). Es la base de datos que hemos usado en el ciclo y cualquier hosting la soporta.  
> * **Drizzle ORM:** escribo consultas tipadas y parametrizadas, que protegen de la inyección SQL. También uso sus **transacciones** para que el stock y el pedido se actualicen a la vez (RNF4).  
> * **NextAuth y Zod:** NextAuth gestiona el login y los roles, y Zod valida los datos en el servidor. Así cumplo que los permisos se comprueben en el servidor (RNF3).

**Herramientas de trabajo.** No van dentro de la aplicación y todas son gratuitas: **VS Code** como editor, **Git y GitHub** para el control de versiones y la integración continua, **Docker** para tener el mismo entorno en desarrollo y en producción, **Figma** para los diseños, **Notion** para el backlog y **Google Analytics** para ver cómo se mueven los usuarios por la tienda.

**Software de pago.** Para el pago con tarjeta elijo **Stripe**: no tiene cuota fija, tiene modo de pruebas y los datos de la tarjeta nunca pasan por mi servidor (PCI DSS). Cobra una comisión por venta (alrededor del 1,5 % \+ 0,25 €). En el MVP2 añado **PayPal**, con una comisión cercana al 3,5 %.

## **2.3 Personal y categoría profesional**

| Perfil | Categoría profesional | Duración | Honorarios | Total |
| :---- | :---- | :---- | :---- | :---- |
| Desarrollador full-stack | Técnico Superior en Desarrollo de Aplicaciones Web | 4 meses | 550 €/mes | 2.200 € |
| Diseñador UI/UX | Diseñador de interfaces (Figma) | 2 semanas | 400 €/semana | 800 € |
| Administrador de sistemas | Técnico de sistemas | Puntual | 500 € (pago único) | 500 € |

Los tres perfiles son funciones que hago yo como autónomo: una sola persona que diseña, programa y pone en marcha el servidor. Son honorarios de autónomo, no un salario de convenio, porque compagino el proyecto con el ciclo y mi dedicación es parcial. Los separo por función para que el cliente vea qué paga en cada parte. En total son **3.500 €**, la línea de desarrollo y diseño del presupuesto.

## **2.4 Interconexión y hosting anual**

| Recurso | Detalles | Coste anual |
| :---- | :---- | :---- |
| Dominio .es | Empresa registradora | 15 € |
| Correo electrónico | 8 cuentas | 50 € |
| Servidor en la nube | AWS o DigitalOcean, 4 vCPU, 8 GB de RAM y 512 GB SSD | 600 € |
| Certificado SSL | Let's Encrypt | 0 € |
| CDN (opcional) | Solo si crece el tráfico; no entra en el total | 200-300 € |

Para desarrollar uso mi propia conexión de fibra de 1 Gbps. El certificado de **Let's Encrypt** es gratuito y basta para que los pagos y los datos del cliente viajen cifrados.

## **2.5 Presupuesto**

| Concepto | Coste |
| :---- | :---- |
| Desarrollo y diseño del ecommerce (personal) | 3.500 € \+ IVA \= 4.235 € |
| Hardware de desarrollo (portátil y móvil, ya poseídos) | 0 € |
| Software libre (tecnologías y herramientas) | 0 € |
| Servidor en la nube (primer año) | 600 € |
| Correo electrónico (primer año) | 50 € |
| Dominio (primer año) | 15 € |
| Certificado SSL | 0 € |
| **Total aprobado** | **4.900 € (IVA incluido)** |

## **2.6 Modo de financiación**

El cliente paga el total en tres plazos ligados a las entregas:

> 1. **40 %** al inicio del proyecto (semana 1), para cubrir el servidor y el dominio.  
> 2. **40 %** al terminar el diseño y el desarrollo principal (semana 12).  
> 3. **20 %** a la entrega y el despliegue (semana 16), con las pruebas y los ajustes finales.

Además, la bodega puede pedir el **Kit Digital** y las ayudas de los centros **CADE** de Andalucía Emprende. El MVP2 lo presupuesto aparte, tras la revisión de los tres meses.

## **2.7 Alternativas y posibles mejoras**

> * **Servidor:** me quedo con la nube porque se amplía sin cambiar de proveedor. Un hosting compartido costaría unos 120 €/año, pero se queda corto. **Vercel** con una base de datos gestionada sería el siguiente paso si la tienda crece.  
> * **Base de datos:** con Drizzle también podría usar **PostgreSQL**, pero elijo MySQL/MariaDB porque es la que mejor conozco. **MongoDB** no encaja, porque los datos de una tienda son relacionales.  
> * **Sistema web:** con **WordPress y WooCommerce** tendría la tienda antes, pero se quedaría corto para la ficha de vino y las reglas de los pedidos.  
> * **Mejoras previstas:** comprimir las imágenes de forma automática, añadir **Bizum**, traducir la tienda y automatizar más correos.

Con este presupuesto la bodega tiene un MVP1 que ya vende y, si la tienda crece, puedo ampliar el servidor sin rehacer nada.

# **3\. Diseño del diagrama de casos de uso**

En este apartado identifico quién usa la tienda y qué puede hacer cada uno. Primero presento los actores y el diagrama general, y después describo los cinco casos de uso principales.

## **3.1 Actores**

| Actor | Rol en el sistema | Qué puede hacer |
| :---- | :---- | :---- |
| **Usuario anónimo** | Visitante | Verificar su edad, navegar por el catálogo, leer las páginas informativas, llenar el carrito, registrarse y entrar. |
| **Cliente** | Usuario registrado | Todo lo del anónimo, y además comprar, cancelar pedidos, descargar facturas y gestionar su perfil. |
| **Editor** | Empleado de la bodega | Todo lo del cliente, y además gestionar el catálogo, las visitas y catas y el blog. |
| **Administrador** | Responsable de la tienda | Todo lo del editor, y además gestionar pedidos, usuarios y roles, bloqueos de venta, tipos de envío y el log. |
| **Pasarela de pago** | Actor secundario (sistema externo) | Procesar los pagos y devolver el resultado. |

## **3.2 Diagrama de casos de uso general**

\[Insertar imagen: docs/tarea02/imagenes/casos-de-uso.png\]

*Figura 2\. Diagrama de casos de uso general.*

El diagrama recoge 19 casos de uso, agrupados por el primer rol que puede usarlos:

> * **Usuario anónimo:** CU14 Verificar edad, CU1 Registrar usuario, CU2 Iniciar sesión, CU16 Recuperar contraseña, CU5 Navegar, buscar y filtrar el catálogo, CU19 Consultar ficha de vino y relacionados, CU4 Gestionar carrito, CU15 Ver carrito y CU18 Consultar páginas informativas y legales.  
> * **Cliente:** CU3 Realizar compra, CU6 Gestionar perfil y direcciones, CU7 Cancelar pedido y CU8 Descargar factura.  
> * **Editor:** CU9 Gestionar catálogo de productos, CU17 Gestionar visitas y catas y CU10 Gestionar blog.  
> * **Administrador:** CU11 Gestionar pedidos y estados, CU12 Gestionar usuarios y roles y CU13 Consultar log, bloquear ventas y gestionar envíos.

**Relaciones del diagrama:**

> * **Generalización entre actores:** Cliente hereda de Usuario anónimo, Editor de Cliente y Administrador de Editor. Por eso cada caso de uso se une solo al primer rol que lo tiene.  
> * **CU3 Realizar compra «include» CU15 Ver carrito:** toda compra empieza revisando el carrito.  
> * **CU16 Recuperar contraseña «extend» CU2 Iniciar sesión:** solo ocurre si el usuario la ha olvidado.  
> * **CU19 Consultar ficha de vino «extend» CU5 Navegar catálogo:** ocurre cuando el usuario abre un producto desde los resultados.  
> * La **pasarela de pago** se asocia al CU3 como actor externo.

Para ver qué hace cada perfil, separo el diagrama por rol. Cada rol hereda los casos de uso del anterior, así que en cada diagrama solo aparecen los suyos, con sus relaciones «include» y «extend».

\[Insertar imagen: capturas/fig03-cu-anonimo.png\]

*Figura 3\. Casos de uso del usuario anónimo.*

\[Insertar imagen: capturas/fig04-cu-cliente.png\]

*Figura 4\. Casos de uso del cliente.*

\[Insertar imagen: capturas/fig05-cu-editor.png\]

*Figura 5\. Casos de uso del editor.*

\[Insertar imagen: capturas/fig06-cu-administrador.png\]

*Figura 6\. Casos de uso del administrador.*

## **3.3 Descripción de los casos de uso principales**

Elijo estos cinco. Los tres primeros cubren el ciclo completo de un pedido: el cliente compra, puede arrepentirse y el administrador lo lleva hasta la entrega. El CU1 recoge la verificación de edad que exige la ley, y el CU9 es la gestión del catálogo, con altas, bajas, modificaciones, listado y búsqueda. Uso la plantilla de **MADEJA** (Junta de Andalucía): la secuencia normal alterna lo que hace el actor y lo que hace el sistema, y cada excepción indica el paso en el que ocurre.

### **CU3 Realizar compra**

| CU3 |  | Realizar compra |
| :---- | :---- | :---- |
| **Dependencias** |  | RF6, RF7, RF8, RNF3 (la tarjeta no pasa por el servidor) y RNF4 (stock y pedido en la misma transacción). |
| **Descripción** |  | El sistema deberá comportarse como se describe a continuación cuando el cliente quiera pagar los productos de su carrito. |
| **Precondición** |  | El cliente ha iniciado sesión, ha verificado que es mayor de edad y tiene en el carrito al menos una presentación con stock. |
| **Secuencia normal** | **Paso** | **Acción** |
|  | 1 | El cliente solicita finalizar la compra desde el carrito. Se realiza el CU15 Ver carrito. |
|  | 2 | El sistema solicita la dirección de envío y la de facturación. |
|  | 3 | El cliente elige una dirección guardada o introduce una nueva. |
|  | 4 | El sistema muestra los tipos de envío disponibles con su coste. |
|  | 5 | El cliente selecciona el tipo de envío. |
|  | 6 | El sistema recalcula el total con IVA y solicita el método de pago. |
|  | 7 | El cliente elige el método de pago y confirma la compra. |
|  | 8 | El sistema comprueba que sigue habiendo stock de todas las presentaciones del carrito. |
|  | 9 | El sistema envía el cobro a la pasarela de pago, que devuelve el resultado. |
|  | 10 | El sistema crea el pedido, descuenta el stock de cada presentación en la misma operación y vacía el carrito. |
|  | 11 | El sistema informa de que el pedido se ha registrado y envía el correo de confirmación. |
| **Postcondición** |  | El pedido queda en estado Confirmado (o Pendiente de pago si es una transferencia), con el stock descontado. La aplicación no guarda los datos de la tarjeta. |
| **Excepciones** | **Paso** | **Acción** |
|  | 3 | La dirección está incompleta o fuera de España: el sistema avisa y no deja continuar hasta corregirla. |
|  | 8 | Otro cliente se ha llevado la última unidad: el sistema avisa de que el producto se ha agotado, no crea el pedido ni cobra y mantiene el carrito. |
|  | 9 | La pasarela rechaza el cobro: el sistema informa al cliente, no crea el pedido y mantiene el carrito. |
|  | 11 | Falla el correo de confirmación: el pedido sigue registrado y el error se guarda en el log de errores. |

### **CU7 Cancelar pedido**

| CU7 |  | Cancelar pedido |
| :---- | :---- | :---- |
| **Dependencias** |  | RF8, RNF3 (el plazo se comprueba en el servidor) y RNF6 (test unitario de la cancelación en 24 horas). |
| **Descripción** |  | El sistema deberá comportarse como se describe a continuación cuando el cliente quiera anular un pedido que todavía no ha salido del almacén. |
| **Precondición** |  | El cliente ha iniciado sesión y tiene un pedido Pendiente de pago, o Confirmado o En proceso creado hace menos de 24 horas. |
| **Secuencia normal** | **Paso** | **Acción** |
|  | 1 | El cliente solicita ver sus pedidos. |
|  | 2 | El sistema muestra el listado de pedidos con su estado. |
|  | 3 | El cliente selecciona el pedido y solicita cancelarlo. |
|  | 4 | El sistema comprueba el estado y el plazo de 24 horas. |
|  | 5 | El sistema pide confirmación y avisa de que la cancelación no se puede deshacer. |
|  | 6 | El cliente confirma la cancelación. |
|  | 7 | El sistema pasa el pedido a Anulado, devuelve las unidades al stock de cada presentación y, si estaba pagado, el importe al cliente. |
| **Postcondición** |  | El pedido queda Anulado por el cliente, con el stock y, en su caso, el importe devueltos. |
| **Excepciones** | **Paso** | **Acción** |
|  | 4 | Han pasado más de 24 horas o el pedido ya está Preparado, Enviado o Entregado: el sistema informa de que ya no se puede cancelar. |
|  | 6 | El cliente no confirma: el pedido no cambia de estado. |

### **CU11 Gestionar pedidos y estados**

| CU11 |  | Gestionar pedidos y estados |
| :---- | :---- | :---- |
| **Dependencias** |  | RF8, RF12, RNF3 (rol comprobado en el servidor) y RNF6 (tests de los estados y del bloqueo a los 15 días). |
| **Descripción** |  | El sistema deberá comportarse como se describe a continuación cuando el administrador quiera consultar los pedidos o cambiar su estado. |
| **Precondición** |  | El administrador ha iniciado sesión con su rol. |
| **Secuencia normal** | **Paso** | **Acción** |
|  | 1 | El administrador solicita el listado de pedidos. |
|  | 2 | El sistema muestra los pedidos paginados y permite filtrarlos por estado, fecha o cliente. |
|  | 3 | El administrador selecciona un pedido. |
|  | 4 | El sistema muestra el detalle y los estados a los que puede pasar. |
|  | 5 | El administrador elige el nuevo estado. Si confirma una transferencia, el pedido pasa de Pendiente de pago a Confirmado. Si lo anula, el sistema devuelve el stock y el importe. |
|  | 6 | El sistema guarda el estado, registra la acción en el log y muestra el pedido actualizado. |
| **Postcondición** |  | El pedido tiene su nuevo estado, visible también para el cliente, y la acción queda en el log. |
| **Excepciones** | **Paso** | **Acción** |
|  | 1 | El usuario no es administrador: el sistema deniega el acceso. |
|  | 4 | El pedido está Bloqueado: el administrador lo revisa y decide si continúa o lo anula. |
|  | 5 | El cambio salta estados (por ejemplo, de Confirmado a Entregado): el sistema no lo guarda, salvo en pedidos que solo tienen visitas o catas. |

### **CU1 Registrar usuario**

| CU1 |  | Registrar usuario |
| :---- | :---- | :---- |
| **Dependencias** |  | RF1, RF2, RNF3 (contraseña guardada con hash) y RNF7 (ninguna venta de alcohol a menores). |
| **Descripción** |  | El sistema deberá comportarse como se describe a continuación cuando un visitante quiera crear su cuenta de cliente. |
| **Precondición** |  | El usuario ha superado la verificación de edad (CU14) y no ha iniciado sesión. |
| **Secuencia normal** | **Paso** | **Acción** |
|  | 1 | El usuario solicita crear una cuenta desde Iniciar sesión. |
|  | 2 | El sistema muestra el formulario de registro. |
|  | 3 | El usuario introduce nombre y apellidos, DNI o NIE, fecha de nacimiento, email y contraseña, y acepta la política de privacidad. |
|  | 4 | El sistema comprueba que tiene 18 años o más, que el DNI y el email no están registrados y que la contraseña es segura. |
|  | 5 | El sistema crea la cuenta con el rol Cliente, guarda la contraseña con hash y envía un correo de verificación. |
|  | 6 | El usuario abre el enlace del correo y su cuenta queda activa. |
| **Postcondición** |  | Existe una cuenta de cliente activa, con la contraseña cifrada, que ya puede comprar. |
| **Excepciones** | **Paso** | **Acción** |
|  | 3 | El usuario no acepta la política de privacidad: el botón Crear cuenta sigue desactivado. |
|  | 4 | El usuario es menor de 18 años: el sistema no crea la cuenta y le explica el motivo. |
|  | 4 | El DNI o el email ya están registrados, o la contraseña no es segura: el sistema lo indica junto al campo y no deja continuar. |
|  | 6 | El enlace ha caducado: el sistema permite pedir uno nuevo. |

### **CU9 Gestionar catálogo de productos**

| CU9 |  | Gestionar catálogo de productos |
| :---- | :---- | :---- |
| **Dependencias** |  | RF4, RF5, RNF3 (rol comprobado en el servidor) y RNF5 (resultado visible de cada acción). |
| **Descripción** |  | El sistema deberá comportarse como se describe a continuación cuando el editor quiera dar de alta, modificar, dar de baja, listar o buscar productos. |
| **Precondición** |  | El editor o el administrador ha iniciado sesión con su rol. |
| **Secuencia normal** | **Paso** | **Acción** |
|  | 1 | El editor solicita el catálogo desde el panel. |
|  | 2 | El sistema muestra los productos paginados, con buscador y filtros por tipo, tipología, bodega y denominación. |
|  | 3 | El editor elige Nuevo producto o selecciona uno existente. |
|  | 4 | El sistema muestra el formulario: tipo, nombre, bodega, denominación, tipología, categorías, uvas con su porcentaje, notas de cata (vista, nariz y boca), etiquetas de cata, pasos de elaboración, imagen y presentaciones con su formato, precio y stock. |
|  | 5 | El editor rellena o modifica los datos y guarda, o pide dar de baja el producto. |
|  | 6 | El sistema valida los datos, guarda el cambio, lo registra en el log y muestra un mensaje de confirmación. |
| **Postcondición** |  | El catálogo queda actualizado en la tienda y la acción queda en el log. |
| **Excepciones** | **Paso** | **Acción** |
|  | 1 | El usuario no es editor ni administrador: el sistema deniega el acceso. |
|  | 6 | Faltan datos obligatorios, el precio o el stock de una presentación es negativo, se repite un formato o la imagen no es válida: el sistema marca los campos y no guarda. |
|  | 6 | El producto tiene pedidos: el sistema no lo borra, lo retira de la venta (IsBlocked) para conservar el historial. |

El resto de casos de uso siguen el mismo patrón, así que no los detallo aquí. Las fichas de los 19 casos y su trazabilidad con los requisitos están en Notion: [Casos de uso completos](https://www.notion.so/40d1b2571dd681979b7eece3bdc87309).

# **4\. Diseño de la interfaz de la aplicación**

He dibujado el mapa de la tienda en Figma, en el mismo archivo donde están los diseños. El diagrama principal es el [mapa visual](https://www.figma.com/design/Q48fEy5Kzr16Tu4rjajUtO/Jotron-26-27?node-id=2009-54820): cada página es una tarjeta con su wireframe y se ve cómo se llega de una a otra. Se puede ver con más detalle, con los elementos y enlaces de cada página, en el [diagrama completo](https://www.figma.com/design/Q48fEy5Kzr16Tu4rjajUtO/Jotron-26-27?node-id=2021-1247).

\[Insertar imagen: capturas/fig07-mapa-visual.png\]

*Figura 7\. Mapa visual de la tienda y del panel (Figma).*

**Cómo se lee el diagrama:**

> * Cada **tarjeta** es una página, con su nombre y su ruta encima.  
> * Las **flechas continuas** son enlaces o botones. El texto de la flecha dice qué botón se pulsa.  
> * Las **flechas discontinuas** son flujo de datos con la pasarela de pago o con la base de datos.  
> * Los colores separan las cuatro zonas: compra, contenido, acceso y cuenta, y panel. El blog y los eventos llevan la etiqueta MVP2.

El mapa enseña las pantallas, pero no las decisiones que cambian el camino. Para eso añado un diagrama de flujo con las cuatro decisiones clave: la edad, la sesión, el pago y el rol.

\[Insertar imagen: capturas/fig08-diagrama-flujo.png\]

*Figura 8\. Diagrama de flujo con las decisiones principales (Figma).*

Todos los diseños están en Figma y se pueden consultar completos: [tienda (front)](https://www.figma.com/design/Q48fEy5Kzr16Tu4rjajUtO/Jotron-26-27?node-id=938-616) y [panel de administración (admin)](https://www.figma.com/design/Q48fEy5Kzr16Tu4rjajUtO/Jotron-26-27?node-id=1061-10458).

## **4.1 Elementos comunes**

> * **Cabecera:** logo, menú (La tienda, Eventos, La bodega, Diario (el blog)), buscador, Iniciar sesión o Mi cuenta, carrito con contador y, solo para editor y administrador, el acceso al panel.  
> * **Pie:** datos de la bodega, redes y enlaces legales.  
> * **Banner de cookies:** aparece en la primera visita con Aceptar, Rechazar y Configurar (RNF7).

## **4.2 Tienda y compra**

En cada página enumero los elementos en el orden en que aparecen en pantalla, de arriba abajo.

**Verificación de edad.** Es lo primero que ve un visitante nuevo (RF2). Contiene el logo y una imagen de la bodega, el aviso de que solo pueden pasar los mayores de 18 años, el campo de fecha de nacimiento y el botón Entrar, que lleva a la portada.

\[Insertar imagen: capturas/fig09-verificacion-edad.png\]

*Figura 9\. Verificación de edad.*

**Portada (/).** Cabecera, imagen principal con el botón Ver vinos, colecciones por tipología, los vinos más vendidos, el banner Visita la bodega (lleva a los eventos), bloques sobre la bodega, últimas noticias del blog y pie.

\[Insertar imagen: capturas/fig10-portada.png\]

*Figura 10\. Portada de la tienda.*

**Catálogo (/productos).** Buscador, filtros (denominación, bodega, uva, tipología, precio y añada), rejilla de productos con imagen, nombre, precio y botón de añadir, y paginación. Si no hay resultados, sale un mensaje y un botón para quitar los filtros.

\[Insertar imagen: capturas/fig11-catalogo.png\]

*Figura 11\. Catálogo con filtros.*

**Ficha de producto (/productos/\[slug\]).** Imágenes, nombre, bodega, denominación y precio, selector de presentación con su stock (o Agotado), cantidad y botón Añadir al carrito, ficha técnica con notas de cata y maridaje y, al final, vinos y artículos relacionados.

\[Insertar imagen: capturas/fig12-ficha-producto.png\]

*Figura 12\. Ficha de producto.*

**Carrito y checkout (/carrito y /checkout).** La compra tiene cuatro pasos y en todos va el resumen del pedido a un lado:

> 1. **Carrito:** líneas con imagen, nombre, precio, cantidad y botón de eliminar, tipo de envío y subtotal con IVA. El botón Finalizar compra lleva al login si no hay sesión.

\[Insertar imagen: capturas/fig13-carrito.png\]

*Figura 13\. Checkout, paso del carrito.*

> 2. **Datos:** contacto y dirección de envío y de facturación, guardada o nueva (solo España).  
> 3. **Pago:** tarjeta, PayPal o transferencia y botón Realizar pedido. Los campos de la tarjeta los sirve la pasarela, así que esos datos nunca pasan por mi servidor (RNF3).

\[Insertar imagen: capturas/fig14-checkout-pago.png\]

*Figura 14\. Checkout, paso de pago.*

> 4. **Confirmación:** número de pedido, resumen y botones Ver mi pedido y Seguir comprando. Si el pago falla, se muestra el motivo y el botón Volver al carrito, con el carrito intacto.

## **4.3 Contenido e información**

> * **Blog y artículo (MVP2):** filtro por categoría, tarjetas y paginación; en el artículo, título, fecha, imagen, texto y vinos relacionados.  
> * **Eventos y ficha de evento (MVP2):** tarjetas con fecha, plazas y precio; en la ficha, programa, plazas libres y botón Reservar, que lo añade al carrito.  
> * **Bodegas, denominaciones y uvas:** listados con imagen y descripción. Desde una bodega se llega a sus vinos en el catálogo.  
> * **Páginas informativas y legales (/\[slug\]):** la bodega, preguntas frecuentes, aviso legal, privacidad, cookies y condiciones de compra. Son estáticas: el texto va en el código y no se edita desde el panel.  
> * **Contacto:** datos de la bodega y formulario con nombre, email y mensaje.

## **4.4 Acceso y área de cliente**

> * **Iniciar sesión:** email, contraseña, botón Entrar y enlaces ¿Olvidaste la contraseña? y Crear cuenta. Después del login, el cliente va a Mi cuenta y el editor o el administrador, al panel.  
> * **Registro:** nombre y apellidos, fecha de nacimiento (compruebo que tenga 18 años o más), email, contraseña segura, casilla de privacidad y botón Crear cuenta, que envía un correo de verificación.  
> * **Recuperar contraseña:** se pide el email y llega un enlace temporal que lleva a la página de contraseña nueva.  
> * **Mi cuenta:** menú lateral (datos, direcciones, pedidos y baja) y formulario de datos personales.  
> * **Mis pedidos y detalle:** lista con número, fecha, total y estado; en el detalle, productos, direcciones, totales, botón Cancelar (solo dentro del plazo del RF8) y Descargar factura (solo si está entregado).

\[Insertar imagen: capturas/fig15-mis-pedidos.png\]

*Figura 15\. Mi cuenta, historial de pedidos.*

> * **Darse de baja:** aviso de lo que se conserva por ley, confirmación y botón de baja (RF3).

## **4.5 Panel de administración**

El panel cambia según el rol. El **editor y el administrador** ven el inicio con indicadores, el catálogo con su formulario de producto, los valores asociados (bodegas, denominaciones, uvas, tipologías y etiquetas de cata) y la gestión de eventos y blog. **Solo el administrador** ve además los pedidos con su cambio de estado, los usuarios y roles (nunca se puede quitar al último administrador), el bloqueo de ventas, los tipos de envío y los logs de acciones y de errores.

\[Insertar imagen: capturas/fig16-admin-panel.png\]

*Figura 16\. Panel de control del administrador.*

\[Insertar imagen: capturas/fig17-admin-producto.png\]

*Figura 17\. Panel, edición de un producto con sus presentaciones y stock.*

\[Insertar imagen: capturas/fig18-admin-pedido.png\]

*Figura 18\. Panel, detalle de un pedido con su estado.*

## **4.6 Flujo de datos**

> * Al añadir un producto o reservar un evento, el carrito se guarda en la base de datos, así el cliente lo recupera en otro dispositivo.  
> * **Pago:** el checkout manda el importe a la pasarela y esta devuelve el resultado. Con él decido si el pedido se crea o se rechaza.  
> * **Pedido:** al confirmarse el pago creo el pedido y descuento el stock en la misma transacción (RNF4).  
> * **Panel y tienda:** lo que se cambia en el panel se ve en la tienda. Un producto bloqueado desaparece del catálogo.  
> * Cada acción de gestión queda guardada en el log de acciones.

Viendo el mapa completo, creo que lo que más me va a costar programar es el pago, porque ahí se juntan la pasarela, el stock y el correo de confirmación.

# **5\. Diseño de la base de datos**

Uso **MariaDB**, el gestor que ya usa el proyecto. Los nombres de tablas y columnas van en inglés, como en el código, y los valores del dominio (estados, tipos de envío, productos) se quedan en español.

## **5.1 Modelo Entidad/Relación**

El enunciado pide el diagrama clásico, con las entidades y las relaciones separadas. Uso la notación de **Chen**: las entidades son rectángulos, las relaciones son rombos con su nombre, los atributos son óvalos y la clave primaria va subrayada. La cardinalidad (1, N o M) va en cada extremo de la relación.

Con 23 entidades y más de 180 atributos, un único diagrama no se puede leer. Por eso lo divido en una vista general y tres diagramas por área con todos los atributos. Las entidades, relaciones y atributos que añade la ampliación van en verde. Los he hecho con **Graphviz**.

\[Insertar imagen: docs/extended/imagenes/bbdd-er-clasico.png\]

*Figura 19\. Modelo E/R clásico, vista general.*

\[Insertar imagen: docs/extended/imagenes/bbdd-er-clasico-pedidos.png\]

*Figura 20\. Modelo E/R, usuarios y pedidos.*

\[Insertar imagen: docs/extended/imagenes/bbdd-er-clasico-catalogo.png\]

*Figura 21\. Modelo E/R, catálogo y eventos.*

\[Insertar imagen: docs/extended/imagenes/bbdd-er-clasico-contenido.png\]

*Figura 22\. Modelo E/R, blog y log de acciones.*

## **5.2 Paso a tablas**

Convierto cada entidad en una tabla y cada relación N:M en una tabla de relación, normalizando hasta la **tercera forma normal**. Las relaciones 1:N se quedan como clave externa en el lado N. Marco las claves primarias con PK y las externas con FK.

**Tablas de entidades:**

> * **User** (UserID PK, Name, LastName, BirthDate, PasswordHash, IDCard, Email, Phone, Role, IsActive, RegistrationDate)  
> * **Address** (AddressID PK, UserID FK → User, Phone, StreetType, StreetName, Number, PostalCode, City, Province, Country, AddressType, IsActive)  
> * **Winery** (WineryID PK, Name, Description, Address, City, Province, Country, Phone, Email, Website, IsBlocked)  
> * **GuaranteeOfOrigin** (GuaranteeOfOriginID PK, Name, Classification, Region, RegulatoryCouncil, FoundedYear, Website, Description, IsBlocked)  
> * **Product** (ProductID PK, ProductType, Name, WineryID FK → Winery, GuaranteeOfOriginID FK → GuaranteeOfOrigin, TypologyID FK → Typology, TaxRate, Vintage, Image, Description, VisualNote, AromaNote, PalateNote, MinTemperature, MaxTemperature, AlcoholContent, FoodPairing, IsBlocked, CreatedAt)  
> * **Category** (CategoryID PK, Name)  
> * **Grape** (GrapeID PK, Name)  
> * **EventType** (EventTypeID PK, Name)  
> * **Event** (EventID PK, Title, Description, EventTypeID FK → EventType, Location, StartsAt, EndsAt, Price, TaxRate, MaxParticipants, AvailableSeats, IsOpen, ImageUrl)  
> * **OrderStatus** (StatusID PK, Name)  
> * **CancellationType** (CancellationTypeID PK, Description)  
> * **ShippingType** (ShippingTypeID PK, Name, Cost)  
> * **Orders** (OrderID PK, UserID FK → User, ShippingAddressID FK → Address, BillingAddressID FK → Address, PaymentMethod, ShippingTypeID FK → ShippingType, ShippingCost, Total, StatusID FK → OrderStatus, StatusUpdatedAt, CancelledBy, CancellationTypeID FK → CancellationType, CreatedAt, ShippingDate)  
> * **Invoice** (InvoiceID PK, OrderID FK → Orders (UNIQUE), Number, IssueDate, TaxBase, TaxAmount, Total)  
> * **Post** (PostID PK, Title, Slug, Excerpt, Content, ImageUrl, PublishedAt, UpdatedAt, IsPublished, UserID FK → User)  
> * **BlogCategory** (BlogCategoryID PK, Name)  
> * **AuditLog** (AuditLogID PK, UserID FK → User, Action, LoggedAt, Details)  
> * **Typology** (TypologyID PK, Name, ProductType, FilterOrder)  
> * **ProductVariant** (VariantID PK, ProductID FK → Product, Size, Capacity, Price, Stock, IsBlocked)  
> * **ProductStep** (StepID PK, ProductID FK → Product, Position, Title, Description)  
> * **TastingTag** (TastingTagID PK, Name)  
> * **EventHighlight** (HighlightID PK, EventID FK → Event, Position, Text)  
> * **EventScheduleItem** (ScheduleItemID PK, EventID FK → Event, StartTime, Description)

**Tablas de relación (de las relaciones N:M):**

> * **ProductCategory** (ProductID PK/FK → Product, CategoryID PK/FK → Category)  
> * **ProductGrape** (ProductID PK/FK → Product, GrapeID PK/FK → Grape, Percentage)  
> * **OrderProduct** (OrderID PK/FK → Orders, VariantID PK/FK → ProductVariant, Quantity, UnitPrice, TaxRate)  
> * **OrderEvent** (OrderID PK/FK → Orders, EventID PK/FK → Event, Quantity, UnitPrice, TaxRate)  
> * **CartProduct** (UserID PK/FK → User, VariantID PK/FK → ProductVariant, Quantity, AddedAt)  
> * **CartEvent** (UserID PK/FK → User, EventID PK/FK → Event, Quantity, AddedAt)  
> * **PostBlogCategory** (PostID PK/FK → Post, BlogCategoryID PK/FK → BlogCategory)  
> * **PostProduct** (PostID PK/FK → Post, ProductID PK/FK → Product)  
> * **PostWinery** (PostID PK/FK → Post, WineryID PK/FK → Winery)  
> * **PostGuaranteeOfOrigin** (PostID PK/FK → Post, GuaranteeOfOriginID PK/FK → GuaranteeOfOrigin)  
> * **PostCategory** (PostID PK/FK → Post, CategoryID PK/FK → Category)  
> * **ProductTastingTag** (ProductID PK/FK → Product, TastingTagID PK/FK → TastingTag)  
> * **GuaranteeOfOriginGrape** (GuaranteeOfOriginID PK/FK → GuaranteeOfOrigin, GrapeID PK/FK → Grape)

## **5.3 Tipos de datos**

Para cada campo indico el tipo de dato que le va mejor en MariaDB y si forma parte de alguna clave. En las tablas de relación, los dos identificadores son INT y forman juntos la clave primaria; cada uno es, además, clave externa.

| Tabla | Campo | Tipo | Clave |
| :---- | :---- | :---- | :---- |
| **User** | UserID | INT AUTO\_INCREMENT | PK |
|  | Name, LastName | VARCHAR(100) |  |
|  | BirthDate | DATE |  |
|  | PasswordHash | VARCHAR(255) |  |
|  | IDCard | VARCHAR(20) | UNIQUE, NOT NULL |
|  | Email | VARCHAR(100) | UNIQUE |
|  | Phone | VARCHAR(20) |  |
|  | Role | ENUM |  |
|  | IsActive | BOOLEAN |  |
|  | RegistrationDate | DATETIME |  |
| **Address** | AddressID | INT AUTO\_INCREMENT | PK |
|  | UserID | INT | FK → User |
|  | Phone | VARCHAR(20) |  |
|  | StreetType, AddressType | ENUM |  |
|  | StreetName, City, Province, Country | VARCHAR(100) |  |
|  | Number, PostalCode | VARCHAR(10) |  |
|  | IsActive | BOOLEAN |  |
| **Product** | ProductID | INT AUTO\_INCREMENT | PK |
|  | ProductType | ENUM |  |
|  | Name | VARCHAR(100) |  |
|  | WineryID | INT | FK → Winery |
|  | GuaranteeOfOriginID | INT | FK → GuaranteeOfOrigin |
|  | TaxRate, MinTemperature, MaxTemperature, AlcoholContent | DECIMAL(5,2) |  |
|  | Vintage | INT |  |
|  | Image | VARCHAR(255) |  |
|  | Description, VisualNote, AromaNote, PalateNote, FoodPairing | TEXT |  |
|  | IsBlocked | BOOLEAN |  |
|  | CreatedAt | DATETIME |  |
| **Category, Grape, EventType, BlogCategory** | ID propio | INT AUTO\_INCREMENT | PK |
|  | Name | VARCHAR(100) | UNIQUE |
| **GuaranteeOfOrigin** | GuaranteeOfOriginID | INT AUTO\_INCREMENT | PK |
|  | Name | VARCHAR(100) | UNIQUE |
|  | IsBlocked | BOOLEAN |  |
| **Winery** | WineryID | INT AUTO\_INCREMENT | PK |
|  | Name | VARCHAR(100) | UNIQUE |
|  | City, Province, Country | VARCHAR(100) |  |
|  | IsBlocked | BOOLEAN |  |
| **Event** | EventID | INT AUTO\_INCREMENT | PK |
|  | Title | VARCHAR(100) | UNIQUE |
|  | Description | TEXT |  |
|  | EventTypeID | INT | FK → EventType |
|  | Location | VARCHAR(150) |  |
|  | StartsAt, EndsAt | DATETIME |  |
|  | Price | DECIMAL(10,2) |  |
|  | TaxRate | DECIMAL(5,2) |  |
|  | MaxParticipants, AvailableSeats | INT |  |
|  | IsOpen | BOOLEAN |  |
| **OrderStatus** | StatusID | INT AUTO\_INCREMENT | PK |
|  | Name | VARCHAR(50) | UNIQUE |
| **CancellationType** | CancellationTypeID | INT AUTO\_INCREMENT | PK |
|  | Description | TEXT |  |
| **ShippingType** | ShippingTypeID | INT AUTO\_INCREMENT | PK |
|  | Name | VARCHAR(50) | UNIQUE |
|  | Cost | DECIMAL(10,2) |  |
| **Orders** | OrderID | INT AUTO\_INCREMENT | PK |
|  | UserID | INT | FK → User |
|  | ShippingAddressID, BillingAddressID | INT | FK → Address |
|  | PaymentMethod, CancelledBy | ENUM |  |
|  | ShippingTypeID | INT | FK → ShippingType |
|  | ShippingCost, Total | DECIMAL(10,2) |  |
|  | StatusID | INT | FK → OrderStatus |
|  | CancellationTypeID | INT | FK → CancellationType |
|  | StatusUpdatedAt, CreatedAt | DATETIME |  |
|  | ShippingDate | DATE |  |
| **Invoice** | InvoiceID | INT AUTO\_INCREMENT | PK |
|  | OrderID | INT | FK → Orders, UNIQUE |
|  | Number | VARCHAR(50) | UNIQUE |
|  | IssueDate | DATETIME |  |
|  | TaxBase, TaxAmount, Total | DECIMAL(10,2) |  |
| **Post** | PostID | INT AUTO\_INCREMENT | PK |
|  | Title | VARCHAR(100) | UNIQUE |
|  | Content | TEXT |  |
|  | ImageUrl | VARCHAR(255) |  |
|  | PublishedAt, UpdatedAt | DATETIME |  |
|  | IsPublished | BOOLEAN |  |
|  | UserID | INT | FK → User |
| **AuditLog** | AuditLogID | INT AUTO\_INCREMENT | PK |
|  | UserID | INT | FK → User |
|  | Action, Details | TEXT |  |
|  | LoggedAt | DATETIME |  |
| **ProductGrape** | Percentage | DECIMAL(5,2) |  |
| **OrderProduct, OrderEvent** | Quantity | INT UNSIGNED |  |
|  | UnitPrice | DECIMAL(10,2) |  |
|  | TaxRate | DECIMAL(5,2) |  |
| **CartProduct, CartEvent** | Quantity | INT UNSIGNED |  |
|  | AddedAt | DATETIME |  |

**Campos y tablas de la ampliación.** Precio, stock y formato salen de Product y pasan a ProductVariant. El resto son columnas y tablas nuevas:

| Tabla | Campo | Tipo | Clave |
| :---- | :---- | :---- | :---- |
| **Winery** | Description | TEXT |  |
|  | Address, Website | VARCHAR(255) |  |
|  | Phone | VARCHAR(20) |  |
|  | Email | VARCHAR(100) |  |
| **GuaranteeOfOrigin** | Classification | ENUM |  |
|  | Region | VARCHAR(100) |  |
|  | RegulatoryCouncil | VARCHAR(150) |  |
|  | FoundedYear | INT |  |
|  | Website | VARCHAR(255) |  |
|  | Description | TEXT |  |
| **Typology** | TypologyID | INT AUTO\_INCREMENT | PK |
|  | Name | VARCHAR(50) | UNIQUE |
|  | ProductType | ENUM |  |
|  | FilterOrder | INT |  |
| **Product** | TypologyID | INT | FK → Typology |
| **ProductVariant** | VariantID | INT AUTO\_INCREMENT | PK |
|  | ProductID | INT | FK → Product |
|  | Size | VARCHAR(50) | UNIQUE con ProductID |
|  | Capacity, Stock | INT |  |
|  | Price | DECIMAL(10,2) |  |
|  | IsBlocked | BOOLEAN |  |
| **ProductStep** | StepID | INT AUTO\_INCREMENT | PK |
|  | ProductID | INT | FK → Product |
|  | Position | INT | UNIQUE con ProductID |
|  | Title | VARCHAR(100) |  |
|  | Description | TEXT |  |
| **TastingTag** | TastingTagID | INT AUTO\_INCREMENT | PK |
|  | Name | VARCHAR(50) | UNIQUE |
| **Event** | ImageUrl | VARCHAR(255) |  |
| **EventHighlight** | HighlightID | INT AUTO\_INCREMENT | PK |
|  | EventID | INT | FK → Event |
|  | Position | INT | UNIQUE con EventID |
|  | Text | VARCHAR(255) |  |
| **EventScheduleItem** | ScheduleItemID | INT AUTO\_INCREMENT | PK |
|  | EventID | INT | FK → Event |
|  | StartTime | TIME | UNIQUE con EventID |
|  | Description | VARCHAR(255) |  |
| **Post** | Slug | VARCHAR(120) | UNIQUE |
|  | Excerpt | TEXT |  |
| **OrderProduct, CartProduct** | VariantID | INT | PK, FK → ProductVariant |
| **ProductTastingTag, GuaranteeOfOriginGrape** | Sus dos ID | INT | PK, FK |

**Por qué estos tipos.** Los precios son **DECIMAL(10,2)** en euros: con DECIMAL no hay errores de redondeo como con FLOAT. Las cantidades son **INT UNSIGNED**, porque no se pueden comprar 1,5 botellas. El código postal es texto para no perder el 0 inicial, y la base de datos va en **utf8mb4** para que las tildes y la ñ salgan bien.

## **5.4 Aclaraciones sobre el diseño**

> * **De 38 a 28 tablas.** En una primera versión convertí en tabla todas las relaciones que parecían N:M. Al revisarlas contra los requisitos vi que varias no lo eran. Por ejemplo, un usuario tiene un solo rol, así que Role pasa a ser un ENUM en User, y cada producto lo hace una sola bodega, así que Product lleva WineryID. Al final también quité StaticPage, porque las páginas informativas y legales son estáticas (RF11).  
> * **Ampliación a 36 tablas.** Al revisar los formularios del panel en Figma vi que el diseño pedía datos que el modelo no tenía. Añado ocho tablas: ProductVariant (presentaciones), Typology, ProductStep (pasos de elaboración), TastingTag y ProductTastingTag (etiquetas de cata), EventHighlight y EventScheduleItem (qué esperar y programa del evento) y GuaranteeOfOriginGrape (uvas autorizadas en cada D.O.). Además, el DNI pasa a ser obligatorio y Post recibe el slug y el extracto que ya usa el código. Las columnas nuevas de bodega y D.O. admiten NULL y se rellenan en el MVP2.  
> * **Tipología y categoría.** Son dos niveles. Typology es la familia que usan los filtros de la tienda (Tinto, Generoso, Dulce) y cada producto tiene una sola. Category es el estilo concreto (Fino, Amontillado, Tinto roble) y sigue siendo N:M.  
> * **Una sola tabla de productos.** Product guarda vinos y pasas, que se distinguen con ProductType. Cada presentación (75 cl, 500 g) es una fila de ProductVariant con su precio y su stock. El pedido y el carrito apuntan a la presentación, porque es lo que se compra y lo que tiene stock.  
> * **Bloqueo de venta.** Product, Winery y GuaranteeOfOrigin tienen su propio IsBlocked. Así, al bloquear una bodega no hay que tocar sus productos uno a uno.  
> * **Precio congelado.** Las líneas del pedido guardan la cantidad, el precio y el IVA del momento de la compra. El catálogo puede cambiar después, pero el pedido no.  
> * **IVA por tipo de producto.** El vino y los eventos van al 21 % y las pasas, al 10 %.  
> * **Borrados.** Las claves que apuntan al historial usan ON DELETE RESTRICT: no se puede borrar un producto con pedidos ni un pedido con factura. Para retirar algo de la tienda está IsBlocked. Los pasos de elaboración y las listas del evento sí se borran en cascada con su producto o su evento.  
> * **Restricciones CHECK.** Stock, precios y plazas nunca negativos, cantidades mayores que cero, IVA válido (4, 10 o 21 %) y temperatura mínima de servicio menor o igual que la máxima.  
> * **Log de errores.** Los errores internos (RNF5) se guardan en un log aparte que el administrador consulta desde el panel. No lo incluyo en el modelo E/R porque no se relaciona con ninguna otra entidad y no forma parte de las reglas de negocio.

## **5.5 Scripts de creación e inserción**

Entrego los scripts en dos archivos independientes dentro del zip:

> 1. **crear-bbdd.sql**: borra la base de datos si existe y crea Jotron con sus 36 tablas (23 de entidades y 13 de relación), 44 claves externas y sus restricciones.  
> 2. **datos-bbdd.sql**: inserta entre 5 y 10 registros por tabla (12 en Orders y OrderProduct, para que haya un pedido en cada estado), con todas las dependencias resueltas, y crea los usuarios, roles y privilegios de MariaDB.

Se ejecutan en ese orden con el cliente de MariaDB (mariadb \-u root \-p \< crear-bbdd.sql). Los he probado sobre MariaDB 10.11, y se pueden volver a lanzar, siempre los dos juntos.

Los datos de prueba son coherentes entre sí: un administrador, dos editores y siete clientes mayores de edad, vinos reales de Andalucía con sus presentaciones, eventos en la bodega y pedidos en los ocho estados del RF8. Los pedidos entregados tienen su factura y el pedido de transferencia sin pagar desde hace más de 15 días está Bloqueado.

**Usuarios, roles y privilegios.** La aplicación no se conecta como root. Cada uso tiene su usuario con el **mínimo privilegio**:

| Rol | Usuario | Privilegios | Para qué |
| :---- | :---- | :---- | :---- |
| rol\_tienda | jotron\_app | SELECT, INSERT y UPDATE en todas las tablas; DELETE solo en direcciones, carrito, tablas de relación y tablas hijas de producto y evento | La aplicación web |
| rol\_informes | jotron\_informes | SELECT | Informes de ventas |
| rol\_copias | jotron\_copias | SELECT, LOCK TABLES, SHOW VIEW, EVENT y TRIGGER | Copias de seguridad |
| rol\_admin\_bd | jotron\_admin | ALL PRIVILEGES sobre Jotron | Mantenimiento y migraciones |

El rol más importante es rol\_tienda: la aplicación **no puede borrar** pedidos, facturas, productos, usuarios ni el log. Lo he comprobado entrando como jotron\_app, y MariaDB devuelve el error 1142 (DELETE command denied). Estos roles son distintos de los de la aplicación (Cliente, Editor y Administrador), que se comprueban en el servidor de Next.js.

Con todo esto, aunque la aplicación tenga un fallo, la base de datos no deja borrar el historial ni guardar un stock negativo.

# **Conclusiones**

Con esta tarea dejo definido lo que voy a programar en los próximos meses. Los requisitos, los casos de uso, las pantallas y la base de datos usan la misma numeración, así que cada decisión se puede seguir de un apartado a otro.

La decisión más importante ha sido ajustar el alcance. Separar el MVP1 del MVP2 me permite publicar en 16 semanas lo que la bodega necesita para vender y cumplir la ley. Además, el presupuesto de 4.900 € es realista para una bodega pequeña y la infraestructura puede crecer si las ventas acompañan.

El siguiente paso es montar el entorno y el modelo de datos con Drizzle, siguiendo el cronograma, y enseñar al cliente los avances en cada revisión de sprint.

# **Anexo. Casos de uso que cambian con la ampliación**

La ampliación de la base de datos no crea casos de uso nuevos: la gestión de tipologías y etiquetas de cata cabe en el CU9 como valores asociados. Sí cambia lo que hacen varios de los 19 casos. Los que describo en el apartado 3.3 ya están corregidos (CU1, CU3, CU7 y CU9). Esta tabla recoge el resto, con las tablas que intervienen:

| Caso de uso | Qué cambia | Tablas | Entra en |
| :---- | :---- | :---- | :---- |
| **CU4 Gestionar carrito** | El cliente añade una presentación concreta (75 cl, 37,5 cl, 500 g) y el stock se controla por presentación. | ProductVariant, CartProduct | MVP1 |
| **CU15 Ver carrito** | Cada línea muestra el formato junto al nombre del producto. | CartProduct, ProductVariant | MVP1 |
| **CU5 Navegar, buscar y filtrar el catálogo** | El filtro de tipología usa la tabla nueva y su orden. El filtro de precio busca en las presentaciones. | Typology, ProductVariant | MVP1 |
| **CU19 Consultar ficha de vino y relacionados** | La ficha deja elegir la presentación y muestra los pasos de elaboración y las etiquetas de cata. Los relacionados por tipología usan Typology. | ProductVariant, ProductStep, ProductTastingTag, Typology | MVP1 |
| **CU11 Gestionar pedidos y estados** | El detalle muestra el formato de cada línea. Al anular, el stock vuelve a cada presentación. | OrderProduct, ProductVariant | MVP1 |
| **CU8 Descargar factura** | Cada línea de la factura lleva el formato. | OrderProduct, ProductVariant | MVP1 |
| **CU12 Gestionar usuarios y roles** | El alta pide el DNI o NIE como obligatorio y comprueba que no se repite. | User | MVP1 |
| **CU6 Gestionar perfil y direcciones** | El cliente no puede dejar el DNI vacío al editar su perfil. | User | MVP1 |
| **CU13 Consultar log, bloquear ventas y gestionar envíos** | Además del producto, la bodega y la D.O., se puede bloquear una sola presentación. | ProductVariant | MVP1 |
| **CU17 Gestionar visitas y catas** | El formulario añade la imagen, la lista Qué esperar y el programa por horas. | Event, EventHighlight, EventScheduleItem | MVP2 |
| **CU10 Gestionar blog** | El artículo lleva slug y extracto. | Post | MVP2 |
| **CU9, valores asociados (bodegas y D.O.)** | Las fichas de bodega y D.O. añaden descripción, contacto, clasificación y uvas autorizadas. | Winery, GuaranteeOfOrigin, GuaranteeOfOriginGrape | MVP2 |

El cambio con más impacto es el de las presentaciones: el carrito, la compra, la cancelación, los pedidos y las facturas pasan a trabajar con ProductVariant en lugar de Product. Por eso actualizo primero las fichas de esos casos en Notion, antes de empezar el MVP1. Los cambios de eventos, blog, bodegas y D.O. pueden esperar al MVP2.