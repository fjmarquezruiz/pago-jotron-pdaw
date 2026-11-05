# Seguridad — E-commerce "Pago de Jotrón"

> **Boceto.** Primera versión del apartado 6 de la Tarea 02. Falta revisarlo y ajustarlo a la extensión final del documento.

En este apartado explico cómo voy a proteger la tienda, los datos de los clientes y el servidor. Sigo los puntos que pide el enunciado: contraseñas, actualizaciones, copias de seguridad, virus y usuarios con roles. Al final añado otras medidas que también afectan a la seguridad de un ecommerce.

## 1. Contraseñas

**De los clientes y del personal de la bodega:**

- Las contraseñas se guardan con un **hash bcrypt** con sal y coste 12, nunca en texto plano. Ni yo ni el administrador podemos leerlas.
- Al registrarse, la contraseña tiene que tener al menos 8 caracteres, con mayúsculas, minúsculas y números (RF2).
- Si un usuario la olvida, recibe un **enlace temporal** por correo para cambiarla. El enlace caduca y solo sirve una vez.
- Limito los intentos de inicio de sesión: después de 5 fallos seguidos, la cuenta se bloquea unos minutos. Así es mucho más difícil probar contraseñas a ciegas.
- La sesión caduca sola tras un tiempo sin actividad.

**Del sistema:**

- Las contraseñas de la base de datos, la pasarela de pago y el correo van en **variables de entorno**, fuera del repositorio de GitHub.
- Cada servicio tiene su propia contraseña, larga y generada al azar. Las guardo en un **gestor de contraseñas** (Bitwarden), no en documentos sueltos.
- Al servidor se entra por **SSH con clave pública**, sin contraseña y sin acceso directo como `root`.

## 2. Actualizaciones

| Qué se actualiza | Cómo | Cada cuánto |
|---|---|---|
| Sistema operativo (Ubuntu Server 24.04 LTS) | Parches de seguridad automáticos con `unattended-upgrades` | Diario |
| Imágenes de Docker (Node.js, MariaDB) | Reconstruir con la última versión LTS de la imagen | Mensual |
| Dependencias del proyecto (npm) | `pnpm audit` y avisos de **Dependabot** en GitHub | Semanal |
| Base de datos | Migraciones versionadas con Drizzle | En cada despliegue |

Ninguna actualización llega a producción sin pasar antes por la **integración continua** (GitHub Actions): si fallan los tests o la compilación, no se despliega. Además, elijo siempre versiones **LTS** porque reciben parches de seguridad durante más tiempo.

## 3. Copias de seguridad

Sigo la regla **3-2-1**: tres copias de los datos, en dos soportes distintos y una de ellas fuera del servidor.

- **Base de datos:** copia completa diaria con `mariadb-dump`, a las 3:00, con el usuario `jotron_copias`, que solo tiene permisos de lectura (`bbdd.md` §5.1).
- **Dónde se guardan:** en el propio servidor y en un almacenamiento externo cifrado (por ejemplo, Amazon S3 o el almacenamiento de DigitalOcean).
- **Cuánto tiempo:** las diarias durante 30 días y una mensual durante un año.
- **Imágenes de producto:** están en **Cloudinary**, que ya guarda sus propias copias.
- **Código:** está en GitHub, así que no depende del servidor.

Una copia que no se ha probado no sirve de nada. Por eso, una vez al mes restauro la última copia en un entorno de pruebas y compruebo que la tienda arranca con esos datos.

## 4. Virus y otros ataques

- **Servidor:** antivirus **ClamAV** con un análisis programado cada semana, y **fail2ban** para bloquear las IP que intentan entrar por fuerza bruta.
- **Cortafuegos:** con `ufw` solo dejo abiertos los puertos 80 y 443 (web) y el de SSH. La base de datos no se puede alcanzar desde internet.
- **Archivos subidos:** solo se suben imágenes desde el panel de administración, y la aplicación comprueba el tipo y el tamaño antes de enviarlas a Cloudinary. Así no se puede colar un ejecutable.
- **Aplicación web:** protección frente a **inyección SQL** (consultas parametrizadas con Drizzle ORM), **XSS** (React escapa el contenido) y **CSRF** (tokens de NextAuth). Todos los datos se validan en el servidor con Zod (RNF3).
- **Equipo de desarrollo:** el portátil tiene el antivirus del sistema activo y el disco cifrado.

## 5. Usuarios con roles y privilegios

Separo dos niveles de usuarios:

**En la aplicación** (RF1), cada rol incluye los permisos del anterior:

| Rol | Qué puede hacer |
|---|---|
| Anónimo | Navegar, buscar y llenar el carrito |
| Cliente | Comprar, ver sus pedidos y facturas y gestionar su perfil |
| Editor | Gestionar el catálogo, los eventos y el blog |
| Administrador | Todo lo anterior, más usuarios, pedidos, bloqueos de venta, tipos de envío y log |

Los permisos se comprueban **en el servidor** en cada petición, no solo ocultando botones. Además, siempre tiene que quedar al menos un administrador, y todas las acciones de gestión quedan en el **log de acciones** (quién, qué y cuándo).

**En la base de datos**, cada uso tiene su usuario de MariaDB con el **mínimo privilegio** (`bbdd.md` §5.1):

- `jotron_app`: la web. Lee y escribe, pero **no puede borrar** pedidos, facturas, productos, usuarios ni el log.
- `jotron_informes`: solo lectura, para informes de ventas.
- `jotron_copias`: lo justo para hacer las copias de seguridad.
- `jotron_admin`: mantenimiento y migraciones. No lo usa la aplicación.

## 6. Otras medidas

- **HTTPS** en toda la web, con certificado de **Let's Encrypt** que se renueva solo.
- **Pagos:** los datos de la tarjeta nunca pasan por nuestro servidor; los gestiona la pasarela, que cumple **PCI DSS**.
- **Datos personales:** cumplo el **RGPD** y la **LOPDGDD**. Al dar de baja una cuenta, sus datos se anonimizan, pero las facturas se conservan el tiempo que marca la ley.
- **Registro de errores:** los errores internos se guardan en un log que revisa el administrador, sin mostrar detalles técnicos al cliente.

## En resumen

La seguridad no depende de una sola medida, sino de varias capas: contraseñas cifradas, servidor actualizado, copias probadas, cortafuegos y permisos mínimos. Si una falla, las demás siguen protegiendo los datos. Lo que más me importa es que, aunque alguien encontrara un fallo en la web, no pudiera borrar los pedidos ni las facturas, y que siempre pueda recuperar la tienda a partir de una copia reciente.
