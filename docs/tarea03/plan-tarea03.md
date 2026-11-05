# Tarea 3 · Plan de trabajo

## Qué pide

Entregable: `Marquez_Ruiz_Francisco_Javier_PROY3.zip`. Total 45 u. (nota = puntos ÷ 45 × 10).

| Archivo | Contenido | Límite |
|---|---|---|
| `01_Plan_ejecucion.pdf` | Apartados 3.1 a 3.7 | 10 págs. |
| `02_Guia_instalacion.pdf` | 3.8.2 | 6 págs. |
| `03_Guia_uso.pdf` | 3.8.3 | 6 págs. |
| `codigo/` | Fuentes documentados (3.8.1) + `.env.example` | — |
| `bd/01_creacion.sql`, `bd/02_datos.sql` | Creación y carga | SQL suelto |
| `README.txt` | Inventario, versión, URL y dónde están las cuentas demo | Breve |

Formato PDF: A4, márgenes 2,5 cm, Arial/Calibri 11 pt, títulos 14-16, interlineado 1,15, 6 pt tras párrafo, tablas ≥ 9 pt, páginas numeradas e índice con enlaces. Máximo 22 páginas nuevas (sin portada, índice ni bibliografía).

Obligatorio para que corrijan: diseño coherente con el código y las guías de instalación y uso.

## Plan por apartados

| # | Apartado | u. | Qué hago | Fuentes que reutilizo |
|---|---|---|---|---|
| 3.1 | Secuencia de ejecución | 6 | Tabla: actividad, orden, depende de, hito, ajuste. Parto del Gantt de la T2 (8 fases, 16 semanas) y explico **solo los cambios**: partir de la base Jotron, fases ya hechas, MVP2 que ya existe en código. | T2 §1.3.4, `plan/PLAN_CONVERSION_JOTRON.md` |
| 3.2 | Recursos y logística | 6 | Tabla actividad → recurso, versión, disponibilidad y preparación. Cubrir desarrollo, pruebas, local y alojamiento. Versiones reales de `package.json` (no las de la T2 si cambiaron). | T2 §2.1-2.4, `package.json`, `docker-compose*.yml` |
| 3.3 | Permisos y autorizaciones | 6 | Tabla necesidad, quién autoriza, condición, estado. Externas: hosting, dominio, Stripe (modo test), Cloudinary, GitHub, imágenes y textos de la bodega, datos personales (RGPD), venta de alcohol. Separar de los roles internos (admin/editor/cliente). Justificar las no aplicables. | `src/lib/gdpr/`, RF2, RNF3, RNF7 |
| 3.4 | Procedimientos | 6 | Cuatro procedimientos con entradas, pasos, salidas y control de cierre: desarrollo (rama `feature/*`), integración (CI con typecheck, lint, Vitest, Playwright), versionado (Conventional Commits, PR, tags) y despliegue (Docker + Nginx + Certbot). Comandos → remitir a la guía. | `AGENTS.md`, `.github/workflows/`, `DEPLOYMENT.md` |
| 3.5 | Riesgos | 5 | Dos matrices separadas. **Laboral**: ergonomía, pantallas, fatiga visual, sedentarismo, estrés por plazo. **Técnico**: pérdida de datos, despliegue roto, migraciones, fallo de Stripe, fuga de secretos, venta a menores. Cada fila: medida, responsable, medios, actuación. | `LESSONS.md` (errores reales) |
| 3.6 | Asignación y tiempos | 5 | Mismo eje que 3.1, añadiendo función (full-stack, UI/UX, sistemas, tester), recurso, duración, periodo y margen. Justificar estimaciones. | T2 §2.3 |
| 3.7 | Coste | 5 | Recalcular desde los 4.900 € de la T2: personal, equipo (amortización del portátil, no compra), software, servicios. Columna **coste estimado** y columna **desembolso real**. Explicar diferencias. | T2 §2.5 |
| 3.8.1 | Código documentado | 2 | Revisar JSDoc en `src/lib/` y Route Handlers (parámetros, retornos, errores). Anexo corto con estructura y responsabilidades. | `MAP.md`, `TECHNICAL_DOCS.md` |
| 3.8.2 | Guía de instalación | 2 | Versiones y descargas, dependencias, `.env`, carga de BD con `bd/*.sql`, arranque, comprobación y problemas habituales. Probar en limpio. | `INSTALL.md`, `DEPLOYMENT.md` |
| 3.8.3 | Guía de uso | 2 | Recorridos por perfil (anónimo, cliente, editor, admin), informes (facturas PDF, listados), mensajes de error, URL y cuentas demo. **Ayuda accesible desde la app.** | Capturas de la T2, casos de uso |

## Huecos que veo

1. **Ayuda en la app:** no hay página `/ayuda`. Hay que crearla (o enlazar a la guía en PDF) desde el pie y el panel.
2. **Scripts SQL:** la BD sale de migraciones Drizzle. Hay que exportar `01_creacion.sql` y `02_datos.sql` y comprobar que cargan en MySQL 8 limpio.
3. **URL en línea:** el `deploy.yml` va a un VPS por SSH. Necesito saber si ya hay servidor y URL operativa.
4. **Cuenta temporal para evaluar:** si piden acceso al hosting, cuenta limitada, no la personal.
5. **Versiones:** contrastar las de la T2 con `package.json` y declarar las reales.

## Orden propuesto

1. 3.1 + 3.6 (misma tabla base) → 3.2 → 3.3 → 3.4 → 3.5 → 3.7.
2. En paralelo en el repo: página de ayuda, export SQL, repaso de JSDoc.
3. Guías 3.8.2 y 3.8.3 al final, cuando la app esté desplegada y con capturas reales.
4. Maquetar los tres PDF y montar el zip con el `README.txt`.
