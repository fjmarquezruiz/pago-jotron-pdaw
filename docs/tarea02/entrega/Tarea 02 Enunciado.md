

**<u>Proyecto 02</u>** 

**1.- Descripción de la tarea para aplicación** 

**2.- Descripción de la tarea para videojuego** 

Obra publicada con Licencia Creative Commons Reconocimiento 4.0 

# **1.- Descripción de la tarea para aplicación** 

**3.- Información de interés** 

**4.- Evaluación de la tarea** 

**Anexo. Licencia de recursos** 



<!-- Start of picture text -->
Caso práctico<br><!-- End of picture text -->

Juan y María van a realizar su primer proyecto (aplicación o videojuego). 

Para ello se reúnen con el cliente para saber lo que quiere. Tienen claro que han de <u>oatsy40</u> desarrollar un buen documento de especificaciones que refleje lo que el cliente realmente quiere y que no haya ambigüedades. Después podrán realizar las fases de análisis y diseño. 

**¿Qué te pedimos que hagas en el caso de que vayas a desarrollar una aplicación de escritorio o móvil?** 

**Para realizar correctamente la tarea hay que realizar las siguientes actividades** incluyéndolas **en un solo documento** Word o Libre Office con su correspondiente índice donde se incluyan todos los apartados y subapartados indicados en la resolución de la tarea, junto con los **dos script de creación y llenado** que van **en dos ficheros independientes** , podéis consultar la sección _Información de interés_ del apartado "Indicaciones de entrega": 

## **1.- Documento de análisis de requisitos.** 





- El documento de especificaciones debe estar basado en los requisitos que el cliente ha indicado (recuerda que si no estás realizando el proyecto para una empresa, entonces el cliente eres tú), indicando todo lo que se quiere conseguir con el proyecto. 

Debes separar los requisitos funcionales de los no funcionales del sistema (restricciones, interfaces externas, control de errores, rendimiento o calidad). 





- Incluye una pequeña planificación del proyecto (el alcance, el coste, un cronograma o secuencia de actividades como un diagrama de Gantt). **Importante.** Este documento será de unas **dos o tres páginas como máximo** . 

## **2.- Necesidades hardware, software y de personal necesarias para la aplicación. Presupuesto.** 















- Elección justificada de la infraestructura hardware necesaria para correr la aplicación. 

- Elección justificada del software gratuito/de pago necesario para la implementación de la aplicación. Necesidades de personal y categoría profesional para llevar a cabo el desarrollo del proyecto. 

- Indicar los recursos de interconexión necesarios para montar dicha infraestructura y de hosting anual. 

- Indicar las alternativas existentes al diseño elegido e indicar posibles mejoras. 

- Presupuesto que incluya el hardware utilizado -se posea o adquirido-, de software -el libre indicando versión y web de descarga- y de personal. Modo de financiación. 

- **Dos páginas máximo.** 

## **3.- Diseño del diagrama  de casos de uso** 







- Obtención de cada uno de los casos de uso junto con los actores y representación del Diagrama de Casos de Uso general -cada caso de uso representa una función o acción que realiza el sistema o aplicación o app  y los actores los que realizan o solicitan esa función. Descripción individual de los principales casos de uso en una tabla con los campos: descripción breve, establecimiento de la/s precondición/es, los pasos habituales, la/s postcondición/es y las excepciones o casos no contemplados, cada caso de uso en media página aproximadamente. La aplicación dispondrá de al menos dos roles, que puedes ser administrador y de empleado; administrador y cliente/usuario; etc. 

## **4.- Diseño de la interfaz de la aplicación** 





- Diseño de las pantallas y de navegación/flujo de pantallas. 

- Para el diseño de interfaces se pueden utilizar aplicaciones genéricas como MS PowerPoint, LO Impress, LO Draw o específicas de diseño de interfaces de usuario como la URL <u>software para diseño de interfaces</u> o <u>herramientas de diseño de interfaz de usuario.</u> 

## **5.- Diseño de la base de datos** 

Si la base de datos es relacional (SQL), el diseño debe incluir: 



- El modelo Entidad/Relación, su paso al modelo relacional y los scripts de creación de tablas (se deberá normalizar si se cree que es necesario). El diagrama debe ser el clásico con las entidades y las relaciones separadas. 



- El **diagrama E/R** deberá indicar entidades, atributos, claves y relaciones. Los nombres de las relaciones y sus cardinalidades deberán indicarse en el gráfico. 



- **Paso a tablas** : Se realizará en formato texto, indicando el nombre de las entidades y entre paréntesis los atributos resultantes del paso a tablas. 







- **Diseño lógico** donde se describen los campos almacenados en las tablas con sus relaciones incluyendo los tipos de datos conjuntamente o por separado. 





- **Tipos de datos** óptimos para el almacenamiento de los atributos. Se realizan aclaraciones sobre aspectos como la obtención de tablas a partir de una relación N:M o claves con varios atributos y aclaraciones que consideres. 



- Crea un **script de creación de la base de datos** . El script debe estar contenido en un archivo independiente y ser funcional. 

- Crea un **script de inserción de datos** en la BD a partir de un conjunto de datos inicial sobre el que poder ir realizando las primeras pruebas. Se debe apoyar en un modelo de datos en el cuál existan al menos 6 tablas, en las que al menos debe existir 3 claves externas indicando relación de unas con otras, así como registros suficientes entre 5 y 10 para cubrir todas las relaciones y ser funcional. 

- **Se contemplan en el script la inclusión de los usuarios, con su privilegios y roles necesarios.** Se requieren al menos 2 roles diferentes, que deberéis definir en función de los requisitos de vuestro proyecto. Podrian ser: administrador y empleado; empleado de tienda y cliente; administrador y usuario estandar; etc. El script debe estar contenido en un archivo ejecutable (*.sql). 

Si se utiliza una base de datos no relacional (NoSQL), el diseño debe incluir: 







**El modelo de datos** (conceptual): 



Tipo de base NoSQL usada (document-store, key-value, columnfamily, graph). 



Descripción de las entidades/conceptos principales 



Indicar el tipo de dato de cada campo 



Indicar que campos son obligatorios y cuáles opcionales. 

## **Ejemplo de documentos/datos.** 

2 o 3 ejemplos de ficheros JSON que muestre cómo se almacenan los datos reales. 



## **Scripts o archivos de creación/carga** : 

Script de creación/configuración si el motor lo requiere (por ejemplo, índices en MongoDB o reglas en Firebase). 





- Archivo(s) de datos iniciales (JSON, CSV o similar) para poder poblar la base de datos y hacer pruebas básicas. 

## **6.- Diagrama de clases (en el caso de que la aplicación no utilice una base de datos).** 





Se realizará el diseño de las clases de la aplicación. Se realizará el diagrama de objetos. 

**Recuerda que el proyecto,** debería contener incondicionalmente aparte de lo que creas necesario: 











- Sistema de autenticación 

- Sistema de gestión (mas de uno que interaccionan) con altas, modificaciones, bajas, listar, búsqueda. 

- Interfaz completa de varias pantallas 

- Varios niveles de acceso 

- Todo lo necesario para cubrir lo indicado en este ERS y posibles situaciones derivadas de los requerimientos 

**Tras la entrega del documento de especificaciones el profesor podrá proponer cambios para ajustarse a la dificultad de un proyecto de estas características.** 







- **Proyecto DAM** : Las aplicación a desarrollar debe ser un software de escritorio o una aplicación para dispositivos móviles Android (las aplicaciones android no deben salir directamente de "cordova", tienen que estar más trabajadas). **Proyecto DAW** : La aplicación a desarrollar debe ser una aplicación web. Posteriormente se alojará en un hosting. **Proyectos conjunto DAM-DAW** : Se le entregará a cada profesor/a la parte correspondiente de su ciclo. Indicándole qué corresponde al proyecto DAM y qué corresponde al proyecto DAW. 

