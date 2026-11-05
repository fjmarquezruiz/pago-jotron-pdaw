# CLAUDE.md

Instrucciones para Claude Code en el proyecto **E-commerce Pago de Jotrón**. Las reglas generales del proyecto (stack, comandos, flujo de trabajo, alcance MVP1/MVP2 y etiqueta de repo) están en `AGENTS.md`, que se carga aquí:

@AGENTS.md

Este archivo solo añade lo que necesito que Claude tenga presente al escribir código. Si algo choca con `AGENTS.md`, manda `AGENTS.md`.

## Antes de empezar

1. Lee `LESSONS.md`. Recoge errores reales que ya nos han costado tiempo (migraciones, middleware, Drizzle sobre MySQL).
2. Si vas a trabajar en `src/app`, `src/components` o `src/lib`, lee el `MAP.md` de esa carpeta y añade al final lo que aprendas.
3. Para cualquier cambio de interfaz, sigue `DESIGN.md`.
4. Para textos de documentación, sigue `ESTILO_ESCRITURA.md`.

## Fuente de verdad

- **Funcional:** `docs/tarea02/` (requisitos RF1..RF13, RNF1..RNF7, casos de uso, modelo de datos y planificación).
- **Código:** el propio código. `TECHNICAL_DOCS.md` ha estado desactualizado otras veces, así que contrasta cada afirmación antes de fiarte.
- **Planes de trabajo:** `plan/`. Cada plan indica su estado por fases.

## Estilo de código

- **TypeScript estricto.** Nada de `any` salvo en utilidades genéricas justificadas. Los tipos globales van en `src/types/`.
- **Server Components por defecto.** Solo añado `'use client'` cuando hay estado, eventos o hooks del navegador.
- **Datos:** las consultas Drizzle viven en `src/lib/db/queries.ts`. La lógica de negocio (estados de pedido, stock, pagos) va en `src/lib/orders/`, `src/lib/payments/`, etc., no dentro del Route Handler.
- **API:** Route Handlers en `src/app/api/`. Validan con Zod, comprueban rol en el servidor y devuelven errores con un mensaje claro en español.
- **Validación:** un único esquema Zod en `src/lib/validations/`, compartido por React Hook Form y la API.
- **Estado de cliente:** Zustand para el carrito (`src/stores/`) y TanStack Query para datos remotos en el panel admin.
- **Estilos:** Tailwind + componentes de `src/components/ui/` y `cn()` de `@/lib/utils`. No meto colores ni tamaños fijos si existe un token (ver `DESIGN.md`).
- **Precios:** en BD se guardan en euros con dos decimales (`DECIMAL(10,2)`, IVA incluido). Para mostrarlos uso `formatEuros()`, nunca formateo a mano.
- **Rutas y textos visibles en español** (`/productos`, `/cuenta/pedidos`, `/admin/pedidos`). Identificadores de código en inglés.
- **Documentación:** cada función, componente, hook o endpoint nuevo lleva su bloque JSDoc en español (skill `code-documentation-standards`).

## Reglas que no se negocian

- Los permisos por rol se comprueban **en el servidor** (RNF3). Ocultar un botón no protege nada.
- No se vende alcohol a menores: cualquier flujo de registro o compra respeta la verificación de edad (RF2).
- Stock y pedido se actualizan en la **misma transacción** (RNF4).
- Los datos de tarjeta nunca pasan por nuestro servidor (PCI DSS, RNF3).
- Con MariaDB uso `like`, no `ilike`.
- Una ruta pública nueva se añade a `isPublicPath` de `src/middleware.ts`; si no, redirige al login.

## Tests

- **Unitarios (Vitest):** junto al archivo que prueban (`*.test.ts`). Son obligatorios para las reglas de negocio críticas: estados de pedido, stock, cancelación en 24 h, bloqueo a los 15 días y protección del último administrador (RNF6).
- **E2E (Playwright):** en `e2e/`, sobre todo para el flujo de compra.
- Para cambios acotados, lanzo solo el test afectado: `pnpm test -- <archivo>`.

## Al terminar

Ejecuto `pnpm typecheck` y `pnpm lint` (y los tests que apliquen) y **muestro la salida**. Si algo falla, busco la causa; no silencio el error. Si he aprendido algo nuevo y verificado, lo registro en `LESSONS.md` con la skill `record-lesson`.
