# DESIGN.md — Guía de diseño e interfaz

Esta guía recoge cómo diseño y construyo la interfaz de **Pago de Jotrón**. La uso como referencia común entre Figma y el código, para que la tienda y el panel de administración se vean y se comporten igual en todas las pantallas.

## 1. Principios

Diseño una tienda para una **bodega tradicional**. Quiero que transmita calidad sin recargar la pantalla, así que sigo cuatro ideas:

- **Menos, pero mejor.** Cada elemento tiene que ayudar a comprar o a conocer la bodega. Si no aporta, lo quito.
- **El producto es el protagonista.** La foto del vino, su nombre y su precio mandan. El resto acompaña.
- **Claro antes que original.** Patrones conocidos de e-commerce (carrito lateral, filtros a la izquierda, checkout por pasos). El usuario no tiene que aprender nada nuevo.
- **Accesible desde el principio** (RNF6), no como un parche al final.

**Además**, ningún diseño pasa a código sin que el cliente lo haya aprobado en **Figma** (RNF1).

## 2. Tokens de diseño

Los colores se definen como variables HSL en `src/app/globals.css` y se exponen en Tailwind (`tailwind.config.ts`) con los nombres de **Shadcn/ui**. En el código uso siempre el token, nunca el color directo.

| Token                       | Uso                                                 |
| --------------------------- | --------------------------------------------------- |
| `background` / `foreground` | Fondo y texto general                               |
| `primary`                   | Botón principal, enlaces destacados, badge de añada |
| `secondary`                 | Acciones secundarias                                |
| `muted`                     | Fondos suaves, textos de apoyo (`muted-foreground`) |
| `accent`                    | Hover en menús y botones `ghost`/`outline`          |
| `destructive`               | Borrar, anular pedido, errores                      |
| `border` / `input` / `ring` | Bordes, campos y anillo de foco                     |
| `card` / `popover`          | Superficies elevadas                                |

**Estado actual:** los valores son los de Shadcn por defecto (primario azul). Mi propuesta es pasar a una paleta de bodega, pendiente de cerrar en Figma con el cliente:

| Token        | Propuesta                         | Motivo                                       |
| ------------ | --------------------------------- | -------------------------------------------- |
| `primary`    | Granate / burdeos (`345 60% 30%`) | Color del vino tinto, identidad de la bodega |
| `secondary`  | Crema cálido (`40 33% 94%`)       | Recuerda a la etiqueta y al papel            |
| `accent`     | Dorado suave (`40 60% 50%`)       | Vinos dulces, pasas y detalles               |
| `foreground` | Casi negro cálido (`20 14% 10%`)  | Mejor lectura que el negro puro              |

Cuando se apruebe, solo hay que cambiar las variables de `globals.css`: los componentes ya usan los tokens. Antes de darla por buena compruebo que el contraste cumple **WCAG AA** (4,5:1 en texto normal).

### Tipografía

- Fuente: **Inter** (`next/font/google`), cargada en `src/app/layout.tsx`.
- Jerarquía con las clases de Tailwind: `text-3xl`/`text-2xl` para títulos de página, `text-lg` para títulos de tarjeta, `text-sm` para textos de apoyo y formularios.
- Si el cliente quiere un toque más clásico, propongo una serif solo para titulares (por ejemplo **Playfair Display**), manteniendo Inter en el cuerpo.

### Espaciado, radios y contenedor

- Escala de espaciado de Tailwind (múltiplos de 4 px). No uso valores sueltos como `mt-[13px]`.
- Radio base `--radius: 0.5rem` (`rounded-lg`); las tarjetas de vino usan `rounded-xl`.
- Contenedor principal: clase `.container-main` (`max-w-7xl` con padding lateral responsive).
- Secciones: clase `.section` (`py-12` → `py-20` según pantalla).

## 3. Responsive

Diseño **mobile-first** con los breakpoints por defecto de Tailwind:

| Breakpoint | Ancho     | Ejemplo en el catálogo                             |
| ---------- | --------- | -------------------------------------------------- |
| base       | < 640 px  | 1 columna, filtros en panel desplegable            |
| `sm`       | ≥ 640 px  | 2 columnas de vinos                                |
| `lg`       | ≥ 1024 px | Filtros fijos a la izquierda (260 px) + 3 columnas |

La tienda tiene que funcionar en móvil, tablet y escritorio, y en **Chrome, Edge, Firefox y Safari** (RNF2).

## 4. Componentes

### Base (`src/components/ui/`)

Son los componentes de **Shadcn/ui** sobre Radix: `button`, `input`, `label`, `textarea`, `select`, `checkbox`, `radio-group`, `switch`, `card`, `table`, `badge`, `tabs`, `dialog`, `alert-dialog`, `dropdown-menu`, `pagination`, `avatar`, `separator` e `ImagePlaceholder`.

- Antes de crear un componente nuevo, compruebo si ya existe aquí.
- Las variantes se definen con `class-variance-authority`, igual que en `button.tsx`.
- Las clases se combinan con `cn()` de `@/lib/utils`.

### Tienda (`src/components/shop/`)

| Componente         | Qué hace                                                         |
| ------------------ | ---------------------------------------------------------------- |
| `Header`           | Cabecera fija: logo, búsqueda, carrito, menú de usuario          |
| `FooterClient`     | Pie con enlaces legales cargados desde la API                    |
| `WineCard`         | Tarjeta de vino: imagen, añada, nombre, tipo y precio            |
| `WineFilters`      | Filtros del catálogo (categoría, DO, bodega, uva, añada, precio) |
| `WineDetailClient` | Ficha de producto con formatos y botón de añadir al carrito      |
| `CartDrawer`       | Carrito lateral                                                  |
| `CookieBanner`     | Aceptar, rechazar o configurar cookies (RNF7)                  |
| `EventCard`        | Tarjeta de visita o cata                                         |

### Panel de administración (`src/components/admin/`)

`WineForm`, `PostForm` y `StaticPageForm` siguen el mismo patrón: **React Hook Form + Zod**, guardar → toast → redirigir → `router.refresh()`. Un formulario nuevo del panel copia este patrón.

## 5. Patrones de interacción

- **Feedback de cada acción** (RNF5): uso toasts de **sonner** mediante `useToast` (`src/hooks/useToast.ts`). Éxito en verde, error en rojo, siempre con un texto que se entienda sin saber de programación.
- **Acciones destructivas** (borrar un vino, anular un pedido): siempre con `alert-dialog` de confirmación y botón `destructive`.
- **Formularios:** etiqueta visible en cada campo, error debajo del campo y botón de enviar desactivado mientras se guarda.
- **Estados vacíos:** si no hay pedidos, favoritos o resultados, explico por qué y ofrezco una salida ("Ver catálogo").
- **Carga:** esqueletos o indicador en el botón, nunca una pantalla en blanco.
- **Estados de pedido:** cada estado tiene su `badge` con el mismo color en la tienda y en el panel (Confirmado, En proceso, Preparado, Enviado, Entregado, Anulado, Bloqueado).
- **Imágenes:** si un vino no tiene foto, `ImagePlaceholder` muestra la silueta de botella.

## 6. Accesibilidad

Me marco como objetivo **WCAG 2.1 nivel AA**:

- Contraste mínimo 4,5:1 en texto y 3:1 en componentes.
- Todo se puede usar con teclado y el foco se ve (`focus-visible:ring-2 ring-ring`).
- Texto alternativo en todas las imágenes de producto (`alt` con el nombre del vino).
- Iconos decorativos con `aria-hidden="true"`; botones solo con icono llevan `aria-label`.
- Áreas táctiles de al menos 44 × 44 px en móvil.
- `lang="es"` en el documento y un único `h1` por página.

## 7. Contenido y tono

- Interfaz en **español** y precios en **euros con IVA incluido** (RNF1).
- Textos cortos y directos. En los botones, verbos de acción: "Añadir al carrito", "Finalizar compra", "Guardar cambios".
- Mensajes de error que dicen qué ha pasado y qué hacer: "No queda stock de este formato. Prueba con otro o vuelve más tarde."

## 8. Deuda de diseño conocida

- `tailwind.config.ts` apunta el token `accent` a `--accient` (errata). Hasta corregirlo, el hover de los botones `ghost` y `outline` no pinta fondo.
- `ProductCard` y `Footer` están duplicados con `WineCard` y `FooterClient` y no se usan. Conviene borrarlos.
- La paleta de bodega del apartado 2 está pendiente de aprobación en Figma.

En resumen, esta guía me sirve para que cada pantalla nueva salga coherente con las demás sin tener que redecidir colores, espacios o patrones. Si una decisión cambia en Figma, la actualizo aquí en el mismo cambio.
