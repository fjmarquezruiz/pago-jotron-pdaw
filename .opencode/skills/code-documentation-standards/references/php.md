# Estándar de documentación — PHP

Se sigue **PHPDoc** (compatible con el estándar **PSR-5**), el mismo que
usan Laravel, Symfony y la mayoría de IDEs (PhpStorm, VSCode con Intelephense)
para autocompletado y análisis estático.

## Cabecera de archivo / clase

```php
<?php

/**
 * Controlador encargado de la gestión del ciclo de vida de los pedidos:
 * creación, cambio de estado, cancelación y descarga de factura.
 */
class PedidoController extends Controller
{
    // ...
}
```

## Métodos y funciones

```php
/**
 * Calcula el total de un pedido aplicando descuentos e IVA.
 *
 * @param array $items Líneas del pedido, cada una con 'precio' y 'cantidad'.
 * @param float $descuento Descuento a aplicar, entre 0 y 1. Por defecto 0.
 *
 * @return float Total del pedido con IVA incluido, redondeado a 2 decimales.
 *
 * @throws \InvalidArgumentException Si algún item tiene precio o cantidad negativos.
 */
public function calcularTotal(array $items, float $descuento = 0): float
{
    // ...
}
```

Reglas:

- Primera línea: descripción breve en indicativo ("Calcula...",
  "Valida...", "Obtiene...").
- `@param` con tipo, nombre y descripción de qué representa — el tipo debe
  coincidir con el type-hint de la firma si existe.
- `@return` siempre presente salvo métodos `void`. Si es `void`, se puede
  omitir o indicar `@return void` según convención del proyecto.
- `@throws` para cada excepción que el método puede lanzar directamente
  (no hace falta documentar excepciones de librerías internas que no se
  gestionan explícitamente).
- Si el método sobreescribe uno de una clase padre o implementa una
  interfaz, usar `@inheritDoc` y añadir solo lo que cambie.

## Propiedades de clase

```php
/**
 * Identificador único del pedido.
 *
 * @var int
 */
private int $pedidoId;
```

## Modelos Eloquent (Laravel)

Documentar las relaciones y accesores/mutadores, no las columnas básicas
(esas ya las describe la migración):

```php
/**
 * Modelo de Pedido. Representa una compra realizada por un cliente,
 * con sus líneas de producto y su estado dentro del ciclo de vida.
 */
class Pedido extends Model
{
    /**
     * Líneas de vino incluidas en este pedido.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function vinos()
    {
        return $this->belongsToMany(Vino::class)->withPivot('cantidad', 'precio_unidad');
    }

    /**
     * Indica si el pedido puede cancelarse: han pasado menos de 5 días
     * desde su creación y sigue en estado "en proceso".
     *
     * @return bool
     */
    public function esCancelable(): bool
    {
        // ...
    }
}
```

## Controladores de API / endpoints

Documentar qué ruta gestiona conceptualmente el método (no la ruta exacta,
eso vive en el archivo de rutas) y qué devuelve al cliente:

```php
/**
 * Confirma un pedido y descuenta el stock de los productos asociados.
 * Devuelve el pedido actualizado o un error 422 si no hay stock suficiente.
 *
 * @param Request $request
 * @param int $pedidoId
 *
 * @return \Illuminate\Http\JsonResponse
 */
public function confirmar(Request $request, int $pedidoId)
{
    // ...
}
```

## Interfaces y traits

```php
/**
 * Contrato para cualquier pasarela de pago integrable en el checkout.
 */
interface PasarelaPagoInterface
{
    /**
     * Procesa el cobro de un pedido.
     *
     * @param float $importe
     * @param array $datosPago
     *
     * @return bool true si el pago se completó correctamente.
     */
    public function procesarPago(float $importe, array $datosPago): bool;
}
```

## Qué NO hacer en PHP

- No usar `@param mixed $x` como comodín; si el tipo puede variar, listar
  las opciones reales (`int|string`).
- No documentar getters/setters triviales autogenerados salvo que tengan
  lógica añadida (validación, transformación).
- No dejar `@return` desincronizado con el type-hint de retorno de la
  firma del método.
