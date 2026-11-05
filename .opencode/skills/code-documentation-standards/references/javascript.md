# Estándar de documentación — JavaScript

Se usa **JSDoc** para todo. Aunque el proyecto no use TypeScript, JSDoc
aporta tipado documental que editores como VSCode aprovechan.

## Plantilla para funciones

```js
/**
 * Calcula el precio total de un pedido aplicando descuentos e IVA.
 *
 * @param {Array<{precio: number, cantidad: number}>} items - Líneas del pedido.
 * @param {number} [descuento=0] - Descuento a aplicar, entre 0 y 1.
 * @returns {number} Total del pedido con IVA incluido, redondeado a 2 decimales.
 * @throws {Error} Si algún item tiene precio o cantidad negativos.
 */
function calcularTotalPedido(items, descuento = 0) {
  // ...
}
```

Reglas:

- Primera línea: descripción breve en una frase, en modo indicativo
  ("Calcula...", "Valida...", "Obtiene..."), no en infinitivo ni gerundio.
- Si hace falta más contexto, un párrafo adicional después de una línea en
  blanco dentro del bloque.
- `@param` siempre con tipo entre llaves, nombre, y descripción de qué
  representa (no solo repetir el nombre). Parámetros opcionales entre
  corchetes: `[nombre=valorPorDefecto]`.
- `@returns` siempre presente si la función retorna algo (aunque sea
  `boolean`). Si no retorna nada, se omite (no usar `@returns {void}` salvo
  que el proyecto ya lo use así).
- `@throws` si la función puede lanzar o rechazar (promesas) en casos
  identificables.
- Funciones `async` documentan qué resuelve la promesa con `@returns
  {Promise<Tipo>}`.

## Funciones flecha y callbacks

Documentar igual que una función normal cuando están exportadas o son
funciones de nivel superior con lógica no trivial:

```js
/**
 * Filtra los pedidos que llevan más de 15 días sin cambiar de estado.
 *
 * @param {Array<Object>} pedidos - Lista completa de pedidos.
 * @returns {Array<Object>} Pedidos candidatos a bloquear.
 */
const obtenerPedidosBloqueables = (pedidos) => {
  // ...
};
```

Callbacks cortos e inline (dentro de un `.map()`, `.filter()`, etc.) no se
documentan con bloque completo salvo que su lógica no sea evidente; en ese
caso basta un comentario de una línea encima.

## Clases

```js
/**
 * Representa el carrito de compra de un usuario y gestiona sus líneas.
 */
class Carrito {
  /**
   * @param {string} usuarioId - Identificador del usuario propietario.
   */
  constructor(usuarioId) {
    // ...
  }

  /**
   * Añade un producto al carrito si hay stock disponible.
   *
   * @param {string} productoId - Identificador del producto.
   * @param {number} cantidad - Unidades a añadir.
   * @returns {boolean} true si se añadió correctamente, false si no hay stock.
   */
  añadirProducto(productoId, cantidad) {
    // ...
  }
}
```

## Módulos / archivos de utilidades

Cabecera de archivo breve arriba del todo, antes de los `import`:

```js
/**
 * Utilidades para formateo de precios y fechas en la interfaz de usuario.
 */
```

## Constantes y objetos de configuración exportados

```js
/**
 * Estados posibles de un pedido, en el orden habitual de su ciclo de vida.
 * @type {Record<string, string>}
 */
export const ESTADOS_PEDIDO = {
  CONFIRMADO: 'confirmado',
  EN_PROCESO: 'en_proceso',
  // ...
};
```
