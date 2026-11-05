---
name: record-lesson
description: Record a verified, actionable lesson into LESSONS.md (project root). Use after finishing a task, debugging session, or failed-and-fixed work where you learned something replayable for future sessions in this repo. Also use when the user asks to save a lesson or mentions LESSONS.md / lessons learned.
---

# Record Lesson

Añade una lección accionable y verificada al archivo `LESSONS.md` de la raíz del proyecto.

## Cuándo usarla

- Después de una tarea donde aprendiste algo que haría que una futura sesión actuara distinto (un error resuelto tras debuggear, un gotcha del entorno, un patrón obligatorio que AGENTS.md no cubre).
- Cuando el usuario lo pida explícitamente ("guarda esta lección", "apunta en LESSONS.md", ...).
- **NO** usarla por cada tarea trivial, ni para elogios/sumarios, ni para contenido que AGENTS.md ya cubre.

## Criterios de inclusión (deben cumplirse TODOS)

1. **Verificada**: observada y ejecutada en esta sesión (hubo evidencia real, no especulación).
2. **Accionable**: formula "cuando X, haz Y". Una futura sesión actuaría distinto.
3. **Específica del repo**: stack, dev container, flujo de BD o convenciones de Jotron.
4. **Nueva**: no está ya cubierta en `LESSONS.md` ni en `AGENTS.md`.

## Procedimiento

1. Lee `LESSONS.md` completo (o haz Grep) para evitar duplicados.
2. Si otra entrada ya cubre lo mismo, no la dupliques: actualízala o cítala. Si es nueva, añade una línea bajo el encabezado de categoría correcto (crea una nueva categoría si hace falta).
3. Formato (máximo ~2 líneas, en español, sin narrativa):
   `- [AAAA-MM-DD] Cuando <situación>, <haz Y> porque <evidencia>`
4. No inventes lecciones que no se vivieron en la sesión.

## Mantenimiento

- Si `LESSONS.md` supera ~30 lecciones o tiene entradas contradictorias, prioriza las verificadas recientemente y las que cambian comportamiento real; elimina ruido.
- Mantén cada lección corta para no inflar el contexto de futuras sesiones.

Herramientas: `Read` (leer LESSONS.md), `Grep` (dedup) y `Edit` (append bajo la categoría correcta).