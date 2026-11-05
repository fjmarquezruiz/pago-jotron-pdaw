# Tarea 2 — Análisis y diseño del proyecto (PDAW)

Índice de trabajo de la Tarea 2. Enlaza cada apartado del enunciado (`Tarea 02 Enunciado - Documentos de Google.pdf`) con los ficheros de esta carpeta y recoge lo que falta para entregar.

## Índice por apartados

| Apartado del enunciado | Qué pide | Documento/s | Puntos | Estado |
| --- | --- | --- | ---: | --- |
| **1. Documento de análisis de requisitos** | Requisitos del cliente. Funcionales (RF1, RF2… entre 10 y 15) separados de los no funcionales (RNF1, RNF2…: restricciones, interfaces externas, control de errores, rendimiento o calidad). Pequeña planificación: alcance, coste y cronograma con **diagrama de Gantt**. **Dos o tres páginas como máximo** | [`requisitos_funcionales.md`](./requisitos_funcionales.md), [`requisitos_no_funcionales.md`](./requisitos_no_funcionales.md), [`planificacion.md`](./planificacion.md) | 2 | ✅ Hecho (falta resumir) |
| **2. Necesidades hardware y software. Financiación** | Hardware y software (gratuito o de pago) justificados, personal con categoría profesional y salario, interconexión y hosting anual, alternativas y mejoras, presupuesto (hardware, software libre con versión y web de descarga, personal) y modo de financiación. **Entre dos y tres páginas** | [`planificacion.md`](./planificacion.md) → apartado 3 "Recursos y coste" | 0,5 | ✅ Hecho |
| **3. Diseño del diagrama de casos de uso** | Casos de uso y actores con el **diagrama general** y sus relaciones. Tabla de los **dos o tres casos principales** (descripción, precondiciones, pasos, postcondiciones y excepciones), media página cada uno. Al menos tres roles: administrador, empleado y cliente | [`casos_de_uso.md`](./casos_de_uso.md), diagrama general [`imagenes/casos-de-uso.png`](./imagenes/casos-de-uso.png) y uno por rol (`imagenes/casos-de-uso-*.png`), hechos en Figma. Los 19 casos, en [`casos_de_uso_extendido.md`](./casos_de_uso_extendido.md) | 2 | ✅ Hecho |
| **4. Diseño de la interfaz de la aplicación** | Diagrama con la página principal y cada subpágina, los elementos que contienen, las conexiones, los enlaces y el flujo de datos entre ellas, descrito en el orden en que aparece en pantalla. Herramienta libre | [`interfaz.md`](./interfaz.md): mapa visual, diagrama de flujo y capturas de las pantallas clave (`imagenes/pantallas/`) | 1,5 | ✅ Hecho |
| **5. Diseño de la base de datos** | Modelo E/R **clásico** (entidades y relaciones separadas, con atributos, claves, nombres de relación y cardinalidades), paso a tablas en texto y tipos de datos. Script de creación en un archivo independiente (mínimo 6 tablas relacionadas). Script de inserción ejecutable con 5 a 10 registros por tabla y los usuarios, privilegios y roles | [`bbdd.md`](./bbdd.md), [`crear-bbdd.sql`](./crear-bbdd.sql), [`datos-bbdd.sql`](./datos-bbdd.sql) (entregable) y [`datos-bbdd-ampliado.sql`](./datos-bbdd-ampliado.sql) (pruebas) | 2 + 2 | ✅ Hecho |
| **6. Seguridad** | Estrategias para las contraseñas, las actualizaciones, las copias de seguridad, los virus y los usuarios con roles y privilegios | [`seguridad.md`](./seguridad.md) | — | 📝 Boceto |

La rúbrica no puntúa aparte la seguridad, pero el enunciado la pide como apartado 6.

## Formato de entrega

1. **Un documento PDF** con **índice navegable** que recoja los seis apartados.
2. **Los fuentes de los scripts** de base de datos: `crear-bbdd.sql` y `datos-bbdd.sql`.
3. El PDF y los scripts, comprimidos en **`marquez_ruiz_francisco_javier_PDAW_Tarea2.zip`**.

## Pendiente para completar la tarea

- [x] **Interfaz** (apartado 4): diagrama de la página principal y las subpáginas con elementos, enlaces y flujo de datos, a partir de las pantallas del RF13.
- [ ] **Seguridad** (apartado 6): revisar el boceto de [`seguridad.md`](./seguridad.md) y dejarlo definitivo.
- [ ] **Extensión**: resumir el apartado 1 a tres páginas como máximo y el 2, a entre dos y tres.
- [ ] **Empaquetado**: montar el PDF con índice navegable y comprimirlo con los dos scripts en `marquez_ruiz_francisco_javier_PDAW_Tarea2.zip`.

## Notas sobre la base de datos

- Los scripts `crear-bbdd.sql` y `datos-bbdd.sql` son funcionales y están probados sobre MariaDB 10.11. `datos-bbdd.sql` es la versión entregable (5-10 registros por tabla) y `datos-bbdd-ampliado.sql`, una versión con más datos para probar la aplicación. Los dos crean los usuarios, roles y privilegios de MariaDB.
- Los nombres de tablas y columnas están en inglés (`User`, `Product`, `Orders`, `Invoice`, `AuditLog`, `GuaranteeOfOrigin`, etc.); los valores del dominio permanecen en español. La tabla de pedidos se llama `Orders` para evitar la palabra reservada `ORDER`, y la denominación de origen se modela como `GuaranteeOfOrigin`.
- La tabla `Product` guarda vinos y pasas (`ProductType`). Las presentaciones del mismo producto se distinguen con `Product.Size` ("75 cl", "500 g", "1 kg"): cada presentación es un producto independiente con su precio y stock.
- Incluyen las correcciones por debajo de la guía anteriormente en el Drive: `datos-bbdd-2.sql` seguía la nomenclatura de Laravel y era incompatible con `crear-bbdd.sql`; las filas de `UsuarioPreferencia*` no existían; `Cantidad` usaba `DECIMAL(10,2)`; el estado "En preparación" no coincidía con el RF8.

## Notas sobre los diagramas

- **Diagrama de casos de uso:** el general (`imagenes/casos-de-uso.png`) y los cuatro por rol están hechos en Figma (página *diagram* de Jotron-26-27), con el mismo estilo que el resto de diagramas. `casos-de-uso.puml` queda como versión en texto del general. Incluye la generalización Anónimo ← Cliente ← Editor ← Administrador y las relaciones `CU3 <<include>> CU15`, `CU16 <<extend>> CU2` y `CU19 <<extend>> CU5`.
- **Modelo E/R clásico:** las entidades se representan con rectángulos y las relaciones con rombos (notación Chen), con las cardinalidades 1/N/M. Los atributos van en óvalos y la clave primaria, subrayada. Hay una vista general (`imagenes/bbdd-er-clasico.png`) y tres diagramas por área con todos los atributos, hechos con Graphviz (fuentes `.dot` junto a los PNG). El diagrama con tipos y claves externas está en `imagenes/bbdd-er.png` (fuente `.mmd`).
- **Interfaz:** el mapa visual (`imagenes/mapa-visual.png`) y el diagrama de flujo (`imagenes/diagrama-flujo.png`) salen de la página *diagram* de Figma. Las capturas de `imagenes/pantallas/` son los diseños de las páginas *front* y *admin*.
