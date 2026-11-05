# Tarea 3. Plan de ejecución

**E-commerce de la Bodega Pago de Jotrón**

Francisco Javier Márquez Ruiz · Proyecto de Desarrollo de Aplicaciones Web (PDAW) · Curso 2026/27

> Borrador en Markdown. Apartados hechos: 3.1, 3.2, 3.3 y 3.6. Pendientes: 3.4, 3.5 y 3.7.

## 3.1. Secuencia de ejecución

Parto del cronograma de la Tarea 2 (apartado 1.3.4): 8 fases en 16 semanas hasta publicar el MVP1. Las fases 1 y 2 (requisitos y diseño) ya están cerradas con la entrega de la Tarea 2. Aquí concreto cómo ejecuto el resto: desarrollo, pruebas, instalación y entrega.

Mantengo la numeración de semanas (S) de la Tarea 2 para que se pueda comparar un plan con el otro. Cada sprint dura dos semanas y termina con una revisión con el cliente.

| ID | Actividad | Semanas | Depende de | Hito al terminar |
|---|---|---|---|---|
| A1 | Requisitos y diseño UX/UI (Tarea 2) | S1-S4 | — | **H0** Diseño aprobado |
| A2 | Repositorio, entorno Docker e integración continua | S5 | A1 | |
| A3 | Modelo de datos, migraciones y scripts SQL de creación y carga | S5-S6 | A2 | **H1** BD cargada en local |
| A4 | Registro, login, roles y verificación de edad (RF1, RF2) | S6-S7 | A3 | |
| A5 | Primer despliegue en el alojamiento | S7 | A3 | **H2** URL en línea |
| A6 | Catálogo, ficha, búsqueda y filtros (RF4, RF5) | S7-S9 | A3 | |
| A7 | Páginas informativas, legales, cookies y ayuda (RF11, RNF7) | S8-S9 | A2 | |
| A8 | Carrito (RF6) | S10 | A6 | |
| A9 | Checkout y pago con tarjeta en modo pruebas (RF7) | S10-S11 | A4, A8 | **H3** Primera compra completa |
| A10 | Pedidos, estados, stock y facturas (RF8) | S11-S12 | A9 | |
| A11 | Panel de administración y log de acciones (RF12, RF13) | S12-S13 | A4, A6, A10 | **H4** MVP1 completo |
| A12 | Pruebas E2E, responsive y accesibilidad | S13-S14 | A11 | **H5** Suite verde en CI |
| A13 | Despliegue final y cuentas de demostración | S14 | A12 | |
| A14 | Guía de instalación y guía de uso | S14-S15 | A11, A13 | |
| A15 | Instalación de prueba en otro equipo | S15 | A3, A14 | **H6** Instalación reproducida |
| A16 | Beta con el cliente y correcciones | S15 | A13 | **H7** Beta aprobada |
| A17 | Empaquetado y entrega (PDF, código, SQL, README) | S16 | A15, A16 | **H8** Entrega de la Tarea 3 |
| A0 | Informe semanal y revisión de sprint | S5-S16 | — | Revisión cada 2 semanas |

Los **tests unitarios** no son una actividad aparte. Los escribo dentro de A4, A9 y A10, junto a las reglas que prueban (estados de pedido, stock, cancelación en 24 h y bloqueo a los 15 días). Lo mismo pasa con la documentación del código: cada función lleva su JSDoc al escribirla.

### Ajustes respecto a la Tarea 2

1. **Desarrollo por módulos, no por capas.** En la Tarea 2 separaba "Lógica y API" (S6-S9) de "Frontend" (S8-S12). Ahora cada módulo va completo: base de datos, API e interfaz. Así, en cada revisión de sprint el cliente ve algo que funciona, y no media tienda sin pantallas.
2. **Pruebas repartidas.** La Tarea 2 dejaba todas las pruebas en S13-S14. Ahora los tests unitarios van con cada módulo y en S13-S14 solo quedan las E2E, el responsive y la accesibilidad. Si una regla de negocio falla, lo veo en el sprint en el que la escribo.
3. **Despliegue adelantado.** Hago un primer despliegue en S7 (A5) en vez de esperar a la semana 16. Los problemas del alojamiento (versiones, variables de entorno, HTTPS) salen pronto y no el día de la entrega.
4. **Actividades nuevas.** La Tarea 3 pide entregables que el plan anterior no tenía: scripts SQL independientes (A3), ayuda accesible desde la aplicación (A7), guías de instalación y uso (A14), una instalación en otro equipo (A15) y el empaquetado final (A17).
5. **Repositorio limpio.** Empiezo el código desde cero en un repositorio nuevo. Aprovecho lo que aprendí en el prototipo anterior (recogido en `LESSONS.md`), pero no arrastro código que no cumple el diseño aprobado.

El **camino crítico** es A2 → A3 → A6 → A8 → A9 → A10 → A11 → A12 → A13 → A14 → A15 → A17. Un retraso en cualquiera de ellas mueve la entrega. Las páginas informativas (A7) y el primer despliegue (A5) tienen holgura y las uso para absorber retrasos.

En resumen, mantengo las 16 semanas y el MVP1 de la Tarea 2, pero ordeno el trabajo para tener algo probado y desplegado en cada sprint.

## 3.2. Recursos y logística

Parto de los recursos de la Tarea 2 (apartados 2.1 a 2.4) y los ato a las actividades de 3.1. Las versiones de las dependencias quedan fijadas en `package.json` y en `pnpm-lock.yaml`, así que en otro equipo se instalan exactamente las mismas.

### Equipos y conectividad

| Recurso | Versión o detalle | Actividades | Disponibilidad | Preparación o acceso |
|---|---|---|---|---|
| Portátil de desarrollo | Intel Core i7, 16 GB de RAM, SSD | A0-A17 | Propio, todo el proyecto | Ya preparado. Copia del repo en GitHub |
| Móvil de pruebas | Smartphone propio, navegador actualizado | A12, A16 | Propio | Acceso a la URL en línea por 4G o wifi |
| Segundo equipo | PC sin el entorno instalado | A15 | Lo reservo para S15 | Solo instalo lo que diga la guía de instalación |
| Conexión a internet | Fibra de 1 Gbps | Todas | Propia | Necesaria para pnpm, Docker Hub, Stripe y despliegue |

### Software de desarrollo y pruebas

| Recurso | Versión | Actividades | Disponibilidad | Preparación o acceso |
|---|---|---|---|---|
| Node.js | 22 LTS | A2-A13 | Gratuito, nodejs.org | Instalador oficial |
| pnpm | 9 | A2-A15 | Gratuito, pnpm.io | `corepack enable` |
| Git + GitHub | Git 2.4x, repositorio privado | A2-A17 | Gratuito | Clave SSH en mi cuenta |
| GitHub Actions | Runner `ubuntu-latest` | A2, A12 | Gratuito, 2.000 min/mes en privados | Flujo `ci.yml` en el repo |
| Docker y Docker Compose | Docker 27, Compose v2 | A2, A3, A15 | Gratuito, docker.com | Solo en local: levanta la BD y el correo de pruebas |
| MariaDB (compatible con MySQL) | 11.4 LTS (imagen `mariadb:11.4`) | A3-A17 | Gratuito, en contenedor | Misma versión que en alwaysdata. Usuario de la app sin permisos de `root` |
| VS Code | Última estable | A2-A14 | Gratuito | ESLint, Prettier y Tailwind CSS IntelliSense |
| Vitest | 1.3 | A4, A9, A10 | Dependencia del proyecto | Se instala con `pnpm install` |
| Playwright | 1.42 (Chromium, Firefox y WebKit) | A12 | Dependencia del proyecto | Descarga de navegadores en la primera ejecución |
| Lighthouse | El de Chrome DevTools | A12 | Gratuito, en el navegador | Sin preparación |
| Figma | Plan gratuito | A7, A12 | Diseños aprobados en la Tarea 2 | Acceso de lectura con mi cuenta |
| Notion | Plan gratuito | A0 | Backlog y Gantt de la Tarea 2 | Página compartida con el cliente |

### Dependencias de la aplicación

| Recurso | Versión | Actividades |
|---|---|---|
| Next.js (incluye React) | 14.2 (React 18.3) | A4-A11 |
| TypeScript | 5.3 | A2-A11 |
| Tailwind CSS + Shadcn/ui | 3.4 | A6-A11 |
| Drizzle ORM + drizzle-kit + mysql2 | 0.45 / 0.31 / 3.9 | A3, A6-A11 |
| NextAuth | 4.24 | A4, A11 |
| Zod + React Hook Form | 3.22 / 7.51 | A4, A9, A11 |
| Zustand + TanStack Query | 4.5 / 5 | A8, A11 |

### Servicios externos

| Recurso | Versión o plan | Actividades | Disponibilidad | Preparación o acceso |
|---|---|---|---|---|
| Stripe | Cuenta en modo pruebas | A9, A10, A12, A16 | Gratuito; en real cobra comisión por venta | Claves de prueba en `.env`, nunca en el repo |
| Cloudinary | Plan gratuito (25 créditos/mes) | A6, A11 | Gratuito | Claves de API en `.env` |
| Correo de pruebas | Mailpit en Docker | A4, A10 | Gratuito, local | Captura los correos sin enviarlos |
| Correo real (SMTP) | Cuentas del dominio | A13, A16 | Contratado en la Tarea 2 | Usuario y clave en `.env` del servidor |
| Alojamiento de la demo | alwaysdata, plan Free: 1 GB SSD, 256 MB de RAM, ¼ de CPU | A5, A13, A16 | Gratuito y sin caducidad | Node.js 22 y MariaDB desde el panel. Acceso por SSH con clave, sin `root` |
| Dirección y HTTPS | Subdominio gratuito `alwaysdata.net` + Let's Encrypt | A5, A13 | Incluido en el plan Free | Certificado activado desde el panel |
| Compilación para producción | GitHub Actions | A5, A13 | Gratuito | `next build` en CI y subida del resultado por SSH |

### Compatibilidad

- **Next.js 14** necesita Node.js 18.17 o superior. Uso **Node.js 22 LTS** en local, en CI y en el servidor, así que no hay diferencias entre entornos.
- **Local y alojamiento usan el mismo motor y versión:** MariaDB 11.4 y Node.js 22. Lo que funciona en el portátil funciona en alwaysdata.
- El driver **mysql2** de Drizzle trabaja igual con MySQL y con MariaDB. Aun así, evito lo que no es común a los dos, como el operador `ilike`.
- **alwaysdata no admite Docker** y 256 MB de RAM no bastan para `next build`. Por eso compilo en GitHub Actions y subo solo el resultado, que con `next start` sí cabe en esa memoria.
- La aplicación funciona en los navegadores que prueba Playwright: Chromium (Chrome y Edge), Firefox y WebKit (Safari).

### Cambios respecto a la Tarea 2

1. **Alojamiento de la demo.** En la Tarea 2 presupuestaba un VPS de 600 € al año. Para la evaluación uso el **plan Free de alwaysdata**: es gratuito, está en la UE (Francia), trae Node.js, MariaDB y HTTPS, y el enunciado recomienda un hosting gratuito. El VPS se queda para la tienda real, cuando el tráfico lo pida.
2. **Base de datos.** En la Tarea 2 dejaba abierta la elección entre MySQL 8.4 y MariaDB. Ahora me quedo con **MariaDB 11.4** en todos los entornos, porque es lo que ofrece alwaysdata. Es compatible con MySQL y, como pide el enunciado MySQL 8.x, compruebo que los scripts SQL cargan también en MySQL 8.4.

En resumen, todo lo que necesito para la demo es propio o gratuito. El VPS, el dominio y el correo de la Tarea 2 solo hacen falta para publicar la tienda real.

## 3.3. Permisos y autorizaciones

Separo dos cosas que no son lo mismo:

- **Autorizaciones externas:** lo que otra persona o empresa me tiene que permitir para desarrollar y publicar la tienda (alojamiento, recursos ajenos, datos).
- **Permisos internos:** lo que cada rol puede hacer dentro de la aplicación. Esos los decido yo en el diseño y los compruebo en el servidor.

Distingo también la **demo de evaluación** de la **tienda real**. En la demo no se vende nada, no se cobra y no hay datos de personas reales. Por eso varias autorizaciones de la tienda real no aplican todavía.

### Autorizaciones externas

| Necesidad | Quién autoriza | Condición de uso | Estado |
|---|---|---|---|
| Alojamiento de la demo | alwaysdata, al aceptar sus condiciones | Plan Free para uso personal: demo académica sin ventas | Pendiente: alta en S7 (A5) |
| Acceso del profesor al alojamiento | Yo, como titular de la cuenta | Acceso temporal y limitado que retiro al terminar la evaluación. Nunca mi cuenta principal | No necesario salvo que el profesor lo pida. Basta con la URL y las cuentas demo |
| Repositorio privado | Yo, como propietario en GitHub | Acceso de solo lectura para el profesor si lo pide | Concedido (repo creado) |
| Dominio de la bodega | La bodega, que es la titular | Solo en la tienda real | No aplica en la demo: uso el subdominio gratuito `alwaysdata.net` |
| Textos, logotipo y fotos de la bodega | La bodega, titular de los derechos | Uso solo en esta tienda | Pendiente de confirmar por escrito. Mientras tanto uso imágenes propias o con licencia libre |
| Imágenes de terceros (Unsplash, Pexels) | La licencia de cada banco | Uso gratuito sin atribución obligatoria | Concedida por la licencia, sin trámite |
| Iconos y fuentes | Licencias Lucide (ISC) y Google Fonts (OFL) | Uso libre, incluido comercial | Concedida por la licencia |
| Librerías del proyecto | Licencias MIT y Apache 2.0 | Compatibles con la licencia GPL-3.0 de mi repositorio | Concedida por la licencia |
| Pasarela de pago | Stripe | Modo pruebas: solo tarjetas de prueba, sin cobros reales | Concedida al crear la cuenta |
| Cobros reales con tarjeta | Stripe, tras verificar a la bodega como empresa | La cuenta tiene que estar a nombre de la bodega | No aplica en la demo |
| Imágenes en Cloudinary | Cloudinary, con sus condiciones del plan gratuito | Límite de 25 créditos al mes | Concedida al crear la cuenta |
| Datos personales en la demo | Nadie: solo uso datos inventados del seed | Sin datos de personas reales | No aplica: el RGPD protege datos de personas reales y aquí no los hay |
| Datos personales en la tienda real | La bodega, responsable del tratamiento | Contrato de encargo del tratamiento conmigo (art. 28 del RGPD) | No aplica hasta publicar la tienda real |
| Venta online de alcohol | La bodega, con sus registros y licencias como productora | Venta solo a mayores de 18 años | No aplica en la demo: no vende. La verificación de edad (RF2) ya va en el MVP1 |
| Instalar en el segundo equipo | El dueño del equipo | Instalo Docker y el proyecto, y lo desinstalo al terminar | Pendiente: lo pido antes de S15 (A15) |

No he presentado ninguna autorización que no tenga. Las que dependen de la bodega quedan como pendientes o no aplicables hasta que la tienda pase a producción.

### Permisos internos de la aplicación

Los roles salen del RF1 de la Tarea 2. No son autorizaciones externas, sino reglas del diseño:

| Rol | Puede | No puede |
|---|---|---|
| Anónimo | Ver el catálogo y el blog, usar el carrito, registrarse | Comprar sin cuenta ni entrar en el área de cliente |
| Cliente | Comprar, ver y cancelar sus pedidos en 24 h, gestionar su perfil | Entrar en el panel de administración |
| Editor | Gestionar el catálogo, el blog y las páginas | Gestionar usuarios, roles, pedidos o el log |
| Administrador | Todo lo del editor, además de usuarios, roles, pedidos, envíos y log | Eliminar o degradar al último administrador |

Compruebo cada permiso en el servidor (RNF3). Ocultar un botón en la interfaz no protege nada.

En resumen, la demo solo necesita el alojamiento, Stripe en pruebas y Cloudinary. El resto son trámites de la bodega que aplican cuando la tienda se publique de verdad.

## 3.6. Asignación y tiempos

Hago el proyecto solo, así que asumo todas las funciones. Las separo para saber qué papel tengo en cada actividad y para valorar cada parte en el coste (3.7):

- **JP**, jefe de proyecto: planificación, informes y revisiones con el cliente.
- **DEV**, desarrollador full-stack: base de datos, API e interfaz.
- **UX**, diseñador UI/UX: revisar que la maquetación sigue los diseños de Figma.
- **QA**, tester: pruebas E2E, responsive, accesibilidad e instalación de prueba.
- **SIS**, administrador de sistemas: entorno, alojamiento y despliegue.
- **DOC**, redactor técnico: guías de instalación y uso.

Como tester, pruebo contra los casos de uso de la Tarea 2 y no contra mi código. Además, en la beta (A16) prueba el cliente, que no conoce el código.

Calculo una **capacidad de 25 horas por semana**, porque compagino el proyecto con el resto del ciclo. De S5 a S16 son 12 semanas, es decir, **300 horas**.

| ID | Función | Recursos | Horas | Periodo | Holgura |
|---|---|---|---|---|---|
| A0 | JP | Notion, correo | 12 | S5-S16 (1 h/sem) | — |
| A2 | DEV, SIS | Portátil, Docker, GitHub | 10 | S5 | 0 |
| A3 | DEV | Docker, MariaDB 11.4, Drizzle | 18 | S5-S6 | 0 |
| A4 | DEV | NextAuth, Zod, Vitest | 20 | S6-S7 | 2 sem |
| A5 | SIS | alwaysdata, GitHub Actions | 8 | S7 | 6 sem |
| A6 | DEV | Next.js, Tailwind, Cloudinary | 30 | S7-S9 | 0 |
| A7 | DEV, UX | Next.js, Figma | 14 | S8-S9 | 4 sem |
| A8 | DEV | Zustand, Vitest | 10 | S10 | 0 |
| A9 | DEV | Stripe (modo pruebas), Vitest | 20 | S10-S11 | 0 |
| A10 | DEV | Drizzle (transacciones), Vitest | 24 | S11-S12 | 0 |
| A11 | DEV | TanStack Query, React Hook Form | 26 | S12-S13 | 0 |
| A12 | QA, UX | Playwright, móvil, GitHub Actions | 18 | S13-S14 | 0 |
| A13 | SIS | alwaysdata, GitHub Actions | 6 | S14 | 0 |
| A14 | DOC | Procesador de textos, capturas | 22 | S14-S15 | 0 |
| A15 | QA, SIS | Segundo equipo, guía de instalación | 4 | S15 | 0 |
| A16 | JP, DEV | URL en línea, cuentas demo | 6 | S15 | 0 |
| A17 | JP | Procesador de textos, PDF | 6 | S16 | 0 |
| | | **Total** | **254** | | |

La holgura es lo que puede retrasarse una actividad sin mover la entrega. Las actividades del camino crítico tienen holgura 0.

### Cómo he estimado las horas

- **Por tamaño del módulo.** Los módulos con más reglas de negocio llevan más horas: pedidos (24 h) y panel (26 h) frente a carrito (10 h).
- **Por experiencia previa.** En el prototipo anterior el catálogo con filtros y el checkout fueron lo más lento. Por eso les doy 30 h y 20 h.
- **Tests incluidos.** Cada módulo con reglas críticas reserva cerca de un 20 % de sus horas para los tests unitarios.

### Carga por semana y margen

| Semana | S5 | S6 | S7 | S8 | S9 | S10 | S11 | S12 | S13 | S14 | S15 | S16 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Horas | 20 | 20 | 25 | 22 | 18 | 21 | 23 | 25 | 24 | 24 | 25 | 7 |

Ninguna semana pasa de las 25 horas, así que no hay solapamientos imposibles. Además, el orden respeta las dependencias de 3.1: ninguna actividad empieza antes de que termine aquella de la que depende.

Dejo un **margen de 46 horas** (un 15 % de la capacidad):

- **18 horas en S16**, que reservo como colchón antes de la entrega.
- **28 horas repartidas** en las semanas con menos carga (S5, S6, S8, S9, S10, S11, S13 y S14).

Si una actividad del camino crítico se retrasa, tiro primero de ese margen. Si no basta, retraso A7 o A5, que tienen holgura. Como último recurso, paso alguna mejora secundaria al MVP2, pero nunca lo que exige la ley (verificación de edad, cookies y textos legales).
