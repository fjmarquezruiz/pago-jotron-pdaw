# Requisitos no funcionales — E-commerce "Pago de Jotrón"

En este documento recojo cómo debe comportarse la aplicación y con qué condiciones la voy a desarrollar. Sigo el mismo orden que pide el enunciado: restricciones, interfaces externas, seguridad, rendimiento, control de errores y calidad.

## RNF1 Restricciones técnicas

- La aplicación es una **aplicación web** hecha con **Next.js 14** (que incluye la API), **TypeScript** y **Tailwind CSS**.
- Los datos se guardan en una base de datos relacional **MySQL/MariaDB**, con **Drizzle ORM**.
- El login y los roles van con **NextAuth**, y los datos se validan en el servidor con **Zod**.
- Se despliega con **Docker** en un servidor en la nube con Ubuntu Server.
- La justificación de cada tecnología y las herramientas de trabajo están en la planificación.
- El trabajo sigue **Scrum** con sprints bisemanales y con algunas prácticas de XP para la calidad del código. El cliente recibe un informe cada semana, nos reunimos en persona cada dos semanas para revisar el estado y recoger su feedback, y prueba la beta durante una semana antes de la publicación.
- Los diseños se presentan al cliente en **Figma** y no se implementan hasta que los aprueba.
- La interfaz está en español y los precios en euros con IVA incluido.

## RNF2 Interfaces externas

- El pago con tarjeta se hace con **Stripe** (MVP1) y el de PayPal en el MVP2, siempre con una **pasarela de pago** externa. La dejo en su propio módulo, para no tener que tocar el resto si más adelante añado otro método. La **transferencia bancaria** no pasa por la pasarela: se muestran los datos de la cuenta y el administrador confirma el cobro a mano.
- Un servicio de correo (SMTP) envía los emails de registro, recuperación de contraseña y confirmación de pedido.
- La aplicación funciona en **Chrome, Edge, Firefox y Safari**, en sus versiones actuales.
- La interfaz es **responsive** y se ve bien en móvil, tablet y ordenador.
- Google Analytics solo se activa si el usuario acepta las cookies.

## RNF3 Seguridad

- Las contraseñas se guardan cifradas con un hash (con sal), nunca en texto plano.
- Toda la comunicación va por **HTTPS**.
- La aplicación debe protegerse contra **inyección SQL, XSS y CSRF**, y validar los datos siempre en el servidor.
- Los permisos por rol se comprueban en el servidor, no solo ocultando botones.
- Los datos de la tarjeta no pasan por nuestro servidor ni se guardan en la base de datos: de eso se encarga la pasarela de pago, que es la que cumple la normativa de tarjetas (**PCI DSS**).
- Las claves y contraseñas de conexión van en variables de entorno, fuera del repositorio.

## RNF4 Rendimiento

- Las páginas deben cargar en pocos segundos con una conexión normal.
- El catálogo, los pedidos, el blog y los usuarios se muestran **paginados** para que siga yendo bien con muchos datos.
- Las imágenes de los productos se optimizan para que no ralenticen la tienda.
- La tienda tiene que estar disponible durante el horario de la bodega. En Navidad, que es cuando más se vende vino, no puede caerse.
- Se hacen copias de seguridad diarias de la base de datos.
- El stock y el pedido se actualizan juntos, para que dos clientes no puedan comprar la última unidad a la vez: se la lleva el primero que completa la compra.
- Una tarea programada diaria bloquea los pedidos que llevan más de 15 días en el mismo estado.

## RNF5 Control de errores

- Los mensajes al usuario son claros y sin faltas, y se entienden sin saber de programación.
- Se informa siempre del resultado de cada acción: éxito, error en un formulario, falta de stock, pago rechazado, etc.
- Los errores internos se guardan en un **log** que pueden consultar los administradores.
- Las situaciones especiales (pedido bloqueado, pago rechazado) se comunican al usuario y al administrador.
- Si falla el correo o la pasarela, no puede quedar un pedido pagado sin registrar.

## RNF6 Calidad

- El código sigue una estructura **modelo-vista-controlador**, con la presentación, la lógica y los datos separados.
- El código está bien organizado, con sangría y nombres claros, y las funciones, métodos y clases llevan comentarios para facilitar el mantenimiento.
- Se hacen **tests unitarios** de las reglas más importantes: estados de los pedidos, stock, cancelación en 24 horas, bloqueo a los 15 días y protección del último administrador.
- Las actualizaciones se despliegan desde GitHub sin cortar el servicio, y los cambios de la base de datos se aplican con migraciones.
- Añadir cosas nuevas, como otro método de pago, no puede romper lo que ya funciona.
- La aplicación es **accesible** para personas con discapacidad (contraste suficiente, uso con teclado y textos alternativos en las imágenes).
- Tanto la tienda como el panel de administración deben ser intuitivos y fáciles de usar.
- Las páginas del catálogo y del blog tienen URLs claras y títulos propios para ayudar al **SEO**.

## RNF7 Cumplimiento legal y privacidad

- **LSSI (Ley 34/2002, de 11 de julio):** la web incluye el aviso legal.
- **RGPD (Reglamento UE 2016/679) y LOPDGDD (Ley Orgánica 3/2018, de 5 de diciembre):** política de privacidad, consentimiento del usuario y derechos de acceso, rectificación y supresión de sus datos.
- **Cookies:** un banner permite aceptar, rechazar y configurar. No se instalan cookies de análisis sin consentimiento.
- **Venta de alcohol (Ley 4/1997):** no se vende a menores de 18 años, con la verificación de edad del RF2.
- **Derecho de desistimiento (Real Decreto Legislativo 1/2007, de 16 de noviembre, Ley General para la Defensa de los Consumidores y Usuarios):** el cliente puede devolver los vinos y las pasas en los 14 días naturales siguientes a recibirlos, sin dar explicaciones. Las condiciones de compra explican cómo hacerlo, y el importe se devuelve en un máximo de 14 días. Las visitas y catas quedan fuera porque tienen una fecha concreta.
- **Facturas y baja de usuarios:** al eliminar una cuenta se anonimizan sus datos, pero las facturas se conservan durante el plazo que marca la ley.

## Resumen

Con estos requisitos busco que la tienda sea segura y fácil de usar, y que la bodega pueda llevarla sin depender de nadie. Lo que más me preocupa es la parte legal: los datos personales, el pago y la venta de alcohol a menores. Es donde menos margen hay para equivocarse, porque no es solo que la aplicación falle, es que puede acabar en una multa.
