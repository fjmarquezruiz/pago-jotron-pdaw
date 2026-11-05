# Pago de Jotrón — E-commerce

Tienda online de la **Bodega Pago de Jotrón**: vende sus vinos, pasas y visitas o catas, además de vinos de otras bodegas de Andalucía. Incluye blog, páginas informativas y un panel de administración para que la bodega gestione todo sin depender de nadie.

Es mi proyecto final del **CFGS de Desarrollo de Aplicaciones Web** (DAW). Partí de un e-commerce genérico (Jotron) y lo he ido convirtiendo al dominio de la bodega (ver `plan/PLAN_CONVERSION_JOTRON.md`).

**Stack:** **Next.js 14 (App Router)**, **TypeScript 5**, **Tailwind CSS + Shadcn/ui**, **Drizzle ORM** (MySQL/MariaDB), **NextAuth v4**, **Zod**, **Zustand + TanStack Query**, **React Hook Form**, **Vitest** y **Playwright**. Imágenes en **Cloudinary**.

Gestor de paquetes: **pnpm** (Node ≥ 20, pnpm ≥ 9).

> **Estado del repo:** parto de cero para la Tarea 3. Aún no hay código; la arquitectura de abajo es la que voy a construir. Las rutas `src/...` se crean según avance.

## Documentos de referencia

| Archivo                        | Para qué                                                                                            |
| ------------------------------ | --------------------------------------------------------------------------------------------------- |
| `CLAUDE.md`                    | Pautas de código específicas para Claude Code                                                       |
| `DESIGN.md`                    | Guía de diseño: tokens, componentes, patrones y accesibilidad                                       |
| `ESTILO_ESCRITURA.md`          | Cómo redactar cualquier texto en nombre del proyecto                                                |
| `LESSONS.md`                   | Lecciones verificadas de sesiones anteriores                                                        |
| `docs/tarea02/`                | Requisitos (RF/RNF), casos de uso, modelo de datos y planificación                                  |
| `plan/`                        | Planes de trabajo por fases, con su estado                                                          |
| `.opencode/skills/`            | Skills del proyecto (`record-lesson`, `code-documentation-standards`); `.claude/skills` enlaza aquí |
| `TECHNICAL_DOCS.md`            | Arquitectura y API (contrastar con el código, a veces va atrasado)                                  |
| `DEPLOYMENT.md` / `INSTALL.md` | Producción e instalación                                                                            |

Los documentos de `docs/tarea02/` son la **fuente de verdad funcional**. Si el código y los requisitos no cuadran, lo señalo antes de cambiar nada.

## Metodología

Trabajo con **Scrum** en **sprints de dos semanas**, adaptado a un equipo de una persona:

- **Backlog** en Notion, ordenado por prioridad y trazado contra los requisitos (RFn / RNFn).
- **Review con el cliente** cada dos semanas e **informe semanal** del estado.
- **Beta** de una semana para que el cliente la pruebe antes de publicar.

**Además**, aplico tres prácticas de **XP** para la calidad del código: tests unitarios de las reglas de negocio, integración continua (GitHub Actions) y refactorización continua. Descarto el resto de XP (programación en pareja, cliente in situ) porque no encaja con un equipo de una persona ni con la disponibilidad de la bodega.

## Alcance por iteraciones (MVP1 y MVP2)

Divido el proyecto en dos entregas. El **MVP1** demuestra una tienda que compra y vende de principio a fin; el **MVP2** añade lo que aporta valor extra.

| MVP1 (publicación en la semana 16)                               | MVP2 (tras la evaluación con el cliente)        |
| ---------------------------------------------------------------- | ----------------------------------------------- |
| Registro, login, roles y **verificación de edad** (RF1, RF2) | Pago con **PayPal** y **transferencia** (RF7) |
| Catálogo, ficha de producto, búsqueda y filtros (RF4, RF5)   | **Blog** con artículos relacionados (RF10)     |
| Carrito y checkout con **pago con tarjeta** (RF6, RF7)       | **Recomendaciones** por historial (RF9)       |
| Pedidos y sus estados, facturas (RF8)                          | **Favoritos** y preferencias (RF3)            |
| Páginas legales y banner de cookies (RF11, RNF7)              | **Visitas y catas** como producto               |
| Panel de administración y log de acciones (RF12)                |                                                 |
| Diseño responsive y accesible, tests unitarios y E2E             |                                                 |

La verificación de edad, las cookies y las páginas legales van en el MVP1 porque son **obligatorias por ley** (RNF7). Parte del MVP2 ya existe en el código; en esa iteración se cierra, se prueba y se valida con el cliente.

**Regla para agentes:** prioriza siempre el trabajo del MVP1. No abras funcionalidades del MVP2 salvo que se pida de forma explícita.

## Comandos

| Comando                     | Uso                                                            |
| --------------------------- | -------------------------------------------------------------- |
| `pnpm dev`                  | Servidor de desarrollo (puerto 3000)                           |
| `pnpm build` / `pnpm start` | Build y servidor de producción                                 |
| `pnpm lint`                 | ESLint (`next lint`)                                           |
| `pnpm typecheck`            | `tsc --noEmit`                                                 |
| `pnpm test`                 | Tests unitarios (Vitest)                                       |
| `pnpm test:e2e`             | Tests E2E (Playwright)                                         |
| `pnpm db:generate`          | Generar migraciones desde `src/db/schema.ts`                   |
| `pnpm db:migrate`           | Aplicar migraciones                                            |
| `pnpm db:push`              | Push directo del schema (solo dev)                             |
| `pnpm db:seed`              | Seed de datos de prueba (`tsx src/db/seed.ts`)                 |
| `pnpm db:images`            | Migrar imágenes a Cloudinary                                   |
| `pnpm menu`                 | Menú interactivo: elegir Docker, Dev Container, reset BD, etc. |
| `pnpm doctor`               | Verificar que el entorno está bien configurado                 |

**Verificación obligatoria al terminar tareas:** ejecutar `pnpm typecheck` y `pnpm lint`. Para cambios con tests, `pnpm test` (y `pnpm test:e2e` si aplica). **Mostrar siempre la evidencia** (salida de los comandos), no afirmar simplemente que compila; atacar la causa raíz de los errores, no suprimirlos.

## Entorno de desarrollo (Docker y Dev Container)

El proyecto soporta **dos flujos de desarrollo igualmente válidos**:

### Docker Standalone (recomendado)

```bash
pnpm run menu
# Selecciona opción 2: "Iniciar con Docker"
```

- App + BD corren en contenedores (imagen `Dockerfile.dev`).
- No necesitas Node/pnpm en tu máquina (todo dentro de Docker).
- Hot-reload activado: edita `src/` y verás cambios al instante en http://localhost:3000.
- Datos de prueba (seed) se pueblan automáticamente.
- MariaDB accesible en `localhost:3306` (credenciales en `docker-compose.dev.yml`).
- Opcional: phpMyAdmin, Redis y Mailhog (con perfil `--profile tools`).

### Dev Container (con VS Code)

```bash
pnpm run menu
# Selecciona opción 3: "Iniciar con Dev Container (VS Code)"
```

- App corre en un contenedor dentro de VS Code.
- Docker **no está disponible dentro del dev container** (el seccomp bloquea _user namespaces_ y no hay `SYS_ADMIN`); el stack de BD está alcanzable en **`db:3306`**.
- phpMyAdmin corre vía PHP embebido en **http://localhost:8080** (`/usr/share/phpmyadmin`, login **root / root_password**). Se instala en la imagen y se inicia automáticamente vía `postStartCommand`.
- Variables típicas (`.env`): `DATABASE_URL=mysql://jotron:jotron_password@db:3306/jotron`, `NEXTAUTH_URL=http://localhost:3000`, `NEXTAUTH_SECRET=...`.

### Usuarios de prueba (en ambos flujos)

Se crean automáticamente con `pnpm db:seed`:

- `admin@jotron.com` / `admin123` (administrador)
- `editor@jotron.com` / `editor123` (editor)
- `user@jotron.com` / `user1234` (cliente)

## Arquitectura

```
src/
├── app/
│   ├── (shop)/          # Tienda pública: portada, productos, categoria, bodegas, uvas,
│   │                    # denominaciones, eventos, blog, carrito, checkout, contacto, [slug]
│   ├── auth/            # Login, registro, recuperar contraseña, verificar email
│   ├── cuenta/          # Área de cliente: pedidos, direcciones, deseos, configuración
│   ├── pedido/          # Confirmación, fallo y detalle de pedido
│   ├── admin/           # Panel (editor/admin): productos, pedidos, usuarios, posts,
│   │                    # páginas, eventos, categorías, auditoría, errores, configuración
│   └── api/             # Route Handlers (auth, cart, checkout, orders, catalog, admin, ...)
├── components/
│   ├── ui/              # Componentes base Shadcn/ui
│   ├── shop/            # Componentes de tienda
│   └── admin/           # Formularios del panel
├── db/                  # schema.ts y seed.ts (Drizzle)
├── lib/
│   ├── db/queries.ts    # Consultas Drizzle
│   ├── orders/          # Estados de pedido y servicio de pedidos
│   ├── payments/        # Pasarela de pago (módulo aislado)
│   ├── auth/ audit/ emails/ gdpr/ constants/
│   ├── auth-options.ts  # Configuración NextAuth
│   ├── utils.ts         # cn(), formatPriceFromCents(), formatEuros(), slugify()...
│   └── validations/     # Esquemas Zod
├── middleware.ts        # Protección de rutas por sesión y rol
├── hooks/               # Custom hooks (useToast)
├── stores/              # Zustand (carrito)
└── types/               # Tipos globales
```

Migraciones SQL versionadas en `drizzle/migrations/` (parten de `0000_baseline.sql`). Config de Drizzle en `drizzle.config.ts`.

## Flujo de trabajo obligatorio

Antes de implementar cualquier cambio, seguir siempre este orden:

1. **Explorar** — entender el código existente, contextos y patrones relevantes al cambio (leer archivos, buscar usos, revisar esquemas y validaciones). Para investigaciones amplias, delegar en subagentes de exploración en vez de saturar el contexto con cientos de archivos.
2. **Planear** — definir el enfoque, los archivos a tocar y los pasos del cambio antes de escribir código. Para cambios pequeños y de alcance claro (un typo, renombrar una variable), se puede pasar directo a implementar sin plan detallado.
3. **Implementar** — realizar los cambios siguiendo las convenciones del proyecto y los patrones de componentes equivalentes existentes (señalar los archivos de referencia). Acotar el scope: no tocar código fuera de la tarea.

Al terminar, **verificar** cada cambio con `pnpm typecheck` y `pnpm lint` mostrando la salida como evidencia; ante fallos, buscar la causa raíz y corregirla, nunca suprimir el error. Para cambios grandes, revisar el diff en un contexto limpio buscando edge cases, scope fuera de la tarea y consistencia con los patrones existentes.

## Mejores prácticas (sesión)

- **Lecciones (`LESSONS.md`)**: al iniciar la sesión (o cuando el usuario lo pida), leer `LESSONS.md` de la raíz: lecciones verificadas de sesiones previas. Al terminar una tarea donde se haya aprendido algo nuevo y verificado, registrarlo con la skill `record-lesson` (dedup + criterios en la skill).
- **Mapas de carpeta**: `src/app`, `src/components` y `src/lib` tienen un `MAP.md`. Leerlo antes de trabajar en esa carpeta y añadir lo aprendido al terminar.
- Corregir el rumbo pronto: si el agente se desvía, indicarlo de inmediato en vez de acumular iteraciones fallidas.
- Usar `/clear` entre tareas no relacionadas; el contexto cargado con material irrelevante degrada los resultados y puede hacer que el agente "olvide" instrucciones.
- Aprovechar checkpoints/revert para deshacer cambios que no funcionan en vez de apilar correcciones.
- Al delegar investigación, pedir resúmenes concisos (p. ej. "explora cómo X y devuelve un resumen"), no el contenido íntegro de los archivos.
- Preferir correr tests puntuales (`pnpm test -- <archivo>`) en vez de toda la suite cuando el cambio es acotado.

## Etiqueta de repo

- No ejecutar `git commit`, `git push` ni crear PRs salvo que el usuario lo pida explícitamente.
- Ramas: `feature/<corta-descripcion>` (p. ej. `feature/cart-api`). PRs concisos contra `main`.
- Mensajes de commit descriptivos en estilo Conventional Commits (`feat:`, `fix:`, `refactor:`, `docs:`...) y acotados al cambio real (no commitear secrets ni cambios fuera de la tarea).
- Al commitear, revisar antes `git status`/`git diff`.
- Tras un commit fallido, corregir y hacer un commit nuevo (no enmendar). Evitar `--force` y cambios de `git config`.

## Convenciones

- **Estilo de escritura**: antes de redactar cualquier documentación, memoria, propuesta, especificación o texto en nombre del proyecto, leer `ESTILO_ESCRITURA.md` (raíz) y seguir la guía: primera persona activa, frases cortas con conectores, listas/tablas para estructurar, negritas para términos clave, justificar decisiones técnicas/de negocio y cerrar con una conclusión práctica.
- **Diseño**: cualquier cambio de interfaz sigue `DESIGN.md` (tokens, componentes, accesibilidad).
- Sigue los patrones de los componentes existentes (Shadcn/ui + `cn()` de `@/lib/utils`).
- Server Components por defecto; usa API Routes (`src/app/api/`) para lógica de servidor y client scope.
- Validaciones con esquemas Zod en `src/lib/validations/` reutilizados por RHF y la API.
- Rutas y textos de la interfaz en español; precios en euros con dos decimales en BD (`DECIMAL(10,2)`) y con IVA en pantalla.
- Cada función, componente o endpoint nuevo lleva JSDoc en español (skill `code-documentation-standards`).
- El proyecto usa ESLint (`eslint-config-next`) + Prettier (`prettier-plugin-tailwindcss`) con Husky + lint-staged en commit.
- Flujo de BD: edita `src/db/schema.ts` → `pnpm db:generate` → `pnpm db:migrate` (o `pnpm db:push` en dev). Tras cambios de seed, correr `pnpm db:seed`.
