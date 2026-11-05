# Tarea 3. Plan de ejecución

**E-commerce de la Bodega Pago de Jotrón**

Francisco Javier Márquez Ruiz · Proyecto de Desarrollo de Aplicaciones Web (PDAW) · Curso 2026/27

> Borrador en Markdown. Apartados hechos: 3.1 y 3.6. Pendientes: 3.2, 3.3, 3.4, 3.5 y 3.7.

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
| A3 | DEV | Docker, MySQL 8, Drizzle | 18 | S5-S6 | 0 |
| A4 | DEV | NextAuth, Zod, Vitest | 20 | S6-S7 | 2 sem |
| A5 | SIS | VPS, dominio, Let's Encrypt | 8 | S7 | 6 sem |
| A6 | DEV | Next.js, Tailwind, Cloudinary | 30 | S7-S9 | 0 |
| A7 | DEV, UX | Next.js, Figma | 14 | S8-S9 | 4 sem |
| A8 | DEV | Zustand, Vitest | 10 | S10 | 0 |
| A9 | DEV | Stripe (modo pruebas), Vitest | 20 | S10-S11 | 0 |
| A10 | DEV | Drizzle (transacciones), Vitest | 24 | S11-S12 | 0 |
| A11 | DEV | TanStack Query, React Hook Form | 26 | S12-S13 | 0 |
| A12 | QA, UX | Playwright, móvil, GitHub Actions | 18 | S13-S14 | 0 |
| A13 | SIS | VPS, Docker, Nginx | 6 | S14 | 0 |
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
