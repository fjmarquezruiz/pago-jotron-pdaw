# Estándar de documentación — React

Se usa **JSDoc** adaptado a componentes, props y hooks. Si el proyecto usa
TypeScript, los tipos van en la firma (`interface`/`type`) y JSDoc se
reduce a la descripción + `@param` sin tipo repetido (ver sección final).

## Componentes funcionales

```jsx
/**
 * Tarjeta de producto que muestra imagen, nombre, precio y botón de
 * añadir al carrito. Deshabilita el botón si no hay stock.
 *
 * @param {Object} props
 * @param {string} props.nombre - Nombre del vino a mostrar.
 * @param {number} props.precio - Precio en euros.
 * @param {string} props.imagenUrl - URL de la imagen del producto.
 * @param {number} props.stock - Unidades disponibles.
 * @param {(id: string) => void} props.onAddToCart - Callback al pulsar "Añadir".
 * @returns {JSX.Element}
 */
function TarjetaProducto({ nombre, precio, imagenUrl, stock, onAddToCart }) {
  // ...
}
```

Reglas:

- La descripción explica **qué muestra/hace el componente** y cualquier
  comportamiento condicional relevante (deshabilitados, estados vacíos,
  variantes visuales).
- Todos los props se documentan individualmente con `props.nombreProp`,
  incluyendo funciones callback con su firma.
- Props opcionales se marcan con corchetes: `[props.variante='default']`.
- No hace falta `@returns {JSX.Element}` si el proyecto ya lo omite de forma
  consistente, pero por defecto se incluye.

## Hooks personalizados

```jsx
/**
 * Gestiona el estado del carrito de compra: añadir, eliminar productos y
 * calcular el total. Persiste el carrito mientras dura la sesión.
 *
 * @returns {{
 *   items: Array<Object>,
 *   total: number,
 *   añadirProducto: (producto: Object) => void,
 *   eliminarProducto: (id: string) => void,
 * }}
 */
function useCarrito() {
  // ...
}
```

Reglas:

- Todo hook custom (`useAlgo`) documenta qué gestiona/orquesta, no solo que
  "es un hook".
- El `@returns` describe la forma completa del objeto/array que devuelve.
- Si el hook tiene efectos secundarios importantes (llamadas a API,
  suscripciones, listeners), se mencionan explícitamente.

## Componentes de clase (si el proyecto los usa)

```jsx
/**
 * Contenedor del formulario de checkout. Gestiona el estado del formulario
 * y la validación antes de confirmar el pedido.
 */
class CheckoutForm extends React.Component {
  /**
   * Valida los datos de envío y pago antes de permitir continuar.
   * @returns {boolean} true si el formulario es válido.
   */
  validar() {
    // ...
  }
}
```

## Contextos

```jsx
/**
 * Contexto de autenticación: expone el usuario actual y los métodos de
 * login/logout a toda la aplicación.
 * @type {React.Context<{usuario: Object|null, login: Function, logout: Function}>}
 */
const AuthContext = createContext(null);
```

## Con TypeScript

Cuando el proyecto usa `.tsx`/`.ts`, los tipos van en la firma y JSDoc solo
aporta la descripción de negocio (no repitas el tipo dos veces):

```tsx
/**
 * Tarjeta de producto con botón de añadir al carrito. Se deshabilita
 * automáticamente cuando no hay stock disponible.
 */
function TarjetaProducto({ nombre, precio, imagenUrl, stock, onAddToCart }: TarjetaProductoProps) {
  // ...
}
```

## Qué NO documentar en React

- No documentar `useState`/`useEffect` internos línea a línea; solo si el
  efecto tiene una razón no evidente (ej. sincroniza con localStorage, evita
  una condición de carrera).
- No repetir en el JSDoc lo que ya dice claramente un tipo de TypeScript.
