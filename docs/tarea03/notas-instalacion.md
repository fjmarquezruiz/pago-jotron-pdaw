# Notas de instalación (cuaderno de trabajo)

Aquí apunto **mientras desarrollo** todo lo que después necesito para la guía de instalación (`02_Guia_instalacion.pdf`, apartado 3.8.2). No es la guía final: en S14 la paso a limpio.

**Regla:** si instalo algo, ejecuto un comando que otro necesitará o me sale un error, lo apunto aquí en el momento.

---

## 1. Versiones y fuentes de descarga

Pongo la versión **exacta** que tengo instalada (`node -v`, `pnpm -v`, `docker -v`, `mysql --version`).

| Herramienta | Versión exacta | Dónde se descarga | Notas |
|---|---|---|---|
| Node.js | | https://nodejs.org | Rama 22 LTS |
| pnpm | | https://pnpm.io | `corepack enable` |
| Git | | https://git-scm.com | |
| Docker Desktop (opcional) | | https://www.docker.com | Solo para la BD local |
| MySQL (sin Docker) | | https://dev.mysql.com/downloads/ | Alternativa a Docker |
| VS Code (recomendado) | | https://code.visualstudio.com | |

## 2. Requisitos del equipo

- Sistema operativo probado:
- RAM y disco mínimos:
- Puertos que usa: 3000 (app), 3306 (MySQL)

## 3. Dependencias del proyecto

Se instalan con `pnpm install`. Apunto aquí las que necesiten algún paso extra (por ejemplo, los navegadores de Playwright).

| Dependencia | Paso extra | Comando |
|---|---|---|
| | | |

## 4. Configuración (`.env`)

Cada variable que añada al proyecto la apunto aquí y en `.env.example`. **Nunca** apunto valores reales.

| Variable | Para qué sirve | Ejemplo / de dónde sale | Obligatoria |
|---|---|---|---|
| `DATABASE_URL` | Conexión a MySQL | `mysql://usuario:clave@localhost:3306/jotron` | Sí |
| `NEXTAUTH_URL` | URL base de la app | `http://localhost:3000` | Sí |
| `NEXTAUTH_SECRET` | Firma de las sesiones | `openssl rand -base64 32` | Sí |
| | | | |

## 5. Base de datos

### 5.1. Con Docker

Comandos que uso para levantar, parar y resetear la BD:

```bash

```

### 5.2. Sin Docker (MySQL instalado)

Pasos para crear la BD y el usuario a mano:

```sql

```

### 5.3. Carga de los scripts

Orden y comando para cargar `bd/01_creacion.sql` y `bd/02_datos.sql`:

```bash

```

Cómo compruebo que se ha cargado bien (consulta y resultado esperado):

## 6. Arranque

| Modo | Comando | Resultado esperado |
|---|---|---|
| Desarrollo | | |
| Producción local | | |
| Tests unitarios | | |
| Tests E2E | | |

## 7. Comprobación final

Lista de lo que tiene que funcionar para dar la instalación por buena:

- [ ] La portada carga en http://localhost:3000
- [ ] Entro con la cuenta de cliente
- [ ] Entro con la cuenta de editor
- [ ] Entro con la cuenta de administrador
- [ ] Hago una compra con tarjeta de prueba de Stripe
- [ ] 

## 8. Despliegue en línea (Vercel + Aiven)

Apunto los pasos en los paneles, qué variables pongo en Vercel y cómo conecto con Aiven (TLS, puerto, usuario).

-

## 9. Problemas habituales

**El apartado más valioso.** Cada error real que me salga, con su causa y su solución.

| Fecha | Fase | Error (mensaje exacto) | Causa | Solución |
|---|---|---|---|---|
| | | | | |

## 10. Prueba en otro equipo (A15)

- Equipo y sistema operativo:
- Tiempo que tardé:
- Pasos de la guía que fallaron o no estaban claros:
- Cambios que hice en la guía después:
