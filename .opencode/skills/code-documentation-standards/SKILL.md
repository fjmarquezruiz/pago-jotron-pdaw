---
name: code-documentation-standards
description: Estándares para documentar código React, JavaScript y PHP (JSDoc, PHPDoc/PSR-5). Úsala SIEMPRE que se escriba, edite, revise o refactorice código en React, JavaScript (incluido TypeScript-lite vía JSDoc) o PHP, aunque el usuario no pida explícitamente "documentación" — cualquier función, componente, clase, hook o endpoint nuevo debe llevar su bloque de documentación siguiendo esta guía. También úsala cuando el usuario pida "documentar este código", "añadir comentarios", "generar docblocks", o al crear archivos nuevos en estos lenguajes.
---

# Estándares de documentación de código

Guía para documentar código de forma consistente en React, JavaScript y PHP.
El objetivo: que cualquier función, componente, clase o endpoint sea
entendible sin tener que leer su implementación completa.

## Regla general

Cada vez que se escriba o modifique código en JS/React/PHP:

1. Todo archivo nuevo lleva una cabecera de archivo (ver abajo).
2. Toda función, método, componente o hook exportado (público) lleva su
   bloque de documentación completo.
3. Funciones privadas/internas triviales (helpers de una línea, callbacks
   inline cortos) no necesitan bloque completo, pero sí un comentario de una
   línea si su propósito no es obvio por el nombre.
4. La documentación se escribe en **español**, salvo que el proyecto ya
   tenga convención en inglés — en ese caso se respeta la existente.
5. Nunca se documenta _qué_ hace el código línea a línea (eso lo dice el
   código); se documenta el _propósito_, los _parámetros_, lo que _devuelve_,
   los _efectos secundarios_ y los _casos límite/errores_.
6. Si al editar una función existente cambian sus parámetros, tipo de
   retorno o comportamiento, el bloque de documentación se actualiza en el
   mismo cambio — nunca se deja desincronizado.

## Selección de guía por lenguaje

- Código **JavaScript puro** (Node, scripts, utils) → `references/javascript.md`
- Componentes y hooks de **React** → `references/react.md`
- Código **PHP** (clases, funciones, Laravel u otros) → `references/php.md`

**TypeScript (este proyecto):** los tipos ya están en la firma (`interface`,
`type`, anotaciones), así que el JSDoc no los repite entre llaves: basta con
la descripción, `@param nombre - qué representa` y `@returns` cuando aporta.
Los props se documentan en la propia `interface` con `/** ... */` por campo
(patrón de `src/components/shop/WineCard.tsx`). Detalle al final de
`references/react.md`.

Lee el archivo de referencia correspondiente antes de escribir el bloque de
documentación — cada uno tiene la plantilla exacta y ejemplos completos.

## Cabecera de archivo (todos los lenguajes)

Todo archivo nuevo empieza con un bloque breve que indica su propósito.
No hace falta repetir el autor/fecha si el proyecto usa control de
versiones (Git ya lo registra), salvo que el proyecto existente lo pida.

```js
/**
 * Gestiona el estado del carrito de compra: añadir, eliminar y calcular
 * totales con impuestos aplicados.
 */
```

```php
<?php
/**
 * Controlador de pedidos: creación, cambio de estado y cancelación
 * dentro de las primeras 24 horas (RF8).
 */
```

## Checklist rápida antes de dar por terminado el código

- [ ] ¿Toda función/método/componente exportado tiene su bloque completo?
- [ ] ¿Cada parámetro documentado indica tipo + qué representa (no solo el
      nombre repetido)?
- [ ] ¿Está documentado qué devuelve, incluidos los casos `null`/vacío?
- [ ] ¿Se documentan los errores/excepciones que puede lanzar la función?
- [ ] ¿Los props de un componente React están todos documentados con su
      tipo y si son opcionales?
- [ ] ¿Se actualizó la documentación si el código cambió de comportamiento?
- [ ] ¿El bloque explica el _porqué_ cuando la lógica no es obvia (no solo
      el _qué_)?

## Qué NO hacer

- No generar documentación redundante tipo `// incrementa i en 1` sobre
  `i++`.
- No dejar placeholders tipo `@param {any} x - descripción` sin completar.
- No mezclar JSDoc y comentarios de bloque `/* */` sueltos sin etiquetas —
  usar siempre las etiquetas estándar (`@param`, `@returns`, etc.).
- No documentar en inglés si el resto del proyecto/documentación está en
  español (y viceversa) — mantener consistencia con lo existente.
