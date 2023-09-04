# Godot Engine 4: Introducción a Godot Engine 4

![godot_welcome_logo](resources/godot_welcome_logo.png)

## Introducción a Godot Engine 4
- [Introducción](introducción)
- [Descargando e instalando Godot Engine](#descargando-e-instalando-godot-engine)
- [Conociendo la interfaz gráfica del Project Manager](#conociendo-la-interfaz-gráfica-del-project-manager)
- [Creando un nuevo proyecto en godot](#creando-un-nuevo-proyecto-en-godot)
- [Estructura de un proyecto Godot](#estructura-de-un-proyecto-godot)
- [Conclusión](#conclusión)
- [Siguiente artículo](#siguiente-artículo-introducción-a-nodos-y-escenas)

## Introducción
En el [artículo anterior](articulo_1_introduccion.md) aprendímos sobre las características fundamentales de Godot Engine 4 y porque comenzar a desarrollar videojuegos usando este [motor de videojuegos](https://es.wikipedia.org/wiki/Motor_de_videojuego).

Ahora en este artículo aprenderemos a descargarlo e instalarlo, a navegar en el Project Manager y verémos cómo es la estructura básica de un proyecto en Godot.

**¡Comencemos!**

## Descargando e instalando Godot Engine

### Descargando Godot
Antes de continuar, cabe destacar que a medida vayan saliendo nuevas actualizaciones
pueden ir cambiando las características del editor y del motor, por lo qué es recomendable mantenerse
al tanto de los cambios y diferencias que hay de una versión y otra, al momento de escribir este artículo estoy
usando la versión 4.1.1 de Godot Engine, dejándo eso en claro, prosigamos con la descarga e instalación de
Godot Engine.

Para descargar Godot nos iremos al [sitio oficial](https://godotengine.org/) para descargar la última versión 
que esté disponible en ese momento.

![download_page_main](resources/dowload_page_main.png)

Daremos click donde dice Download Latest

![dowload_page_redirection](resources/dowload_page_redirection.png)

Nos redirigira a la página de descarga de la última versión de Godot para nuestro sistema operativo y haremos click en la primera opcíón que sólo dice Godot Engine, en mi caso como estoy usando una distribución Linux me aparece una página de descarga para Linux, pero en caso que tengas otro sistema operativo como Windows o MacOS te debería redirigir a la página correspondiente de descarga para el sistema operativo que estés usando.

### Instalación de Godot

Cuando se termine la descarga nos quedará un archivo como esté:

![godot_zip_file](resources/godot_zip_file_win.png)

Lo siguiente que debemos hacer ahora es descomprimir el archivo y nos quedará una carpeta como la siguiente:

![uncompress_godot_zip](resources/uncompress_godot_zip_win.png)

Abrimos la carpeta y ahí encontraremos el ejecutable de godot:

![godot_executable_file](resources/godot_executable_file_win.png)

Ahora sólo damos doble click sobre el ejecutable para abrirlo y ¡ya tendrémos a Godot ejecutandosé en nuestra computadora!

## Conociendo la interfaz gráfica del Project Manager
Cuándo nosotros abrímos Godot por primera vez nos encontraremos con la interfaz del manejador de proyectos o el [project manager](https://docs.godotengine.org/en/stable/tutorials/editor/project_manager.html), esta interfaz nos proporciona de varios elementos visuales e interactivos con los que podemos administrar nuestros proyectos godot:

![godot_running](resources/godot_running.png)

## Veamos las partes que componen esta interfaz gráfica

### Esquina superior derecha
![right-top-corner](resources/editor_right_top_corner.png)

En la esquina superior derecha podemos observar primero la versión actual de Godot que estámos usando en nuestro sistema operativo; luego a la derecha podemos observar un menú desplegable en el que si hacemos click izquierdo nos mostrará una lista de idiomas que podemos elegir como idioma del editor; se recomienda elegir el inglés como idioma principal del editor ya que la mayoría de cursos o tutoriales que encontrarás en internet usan el inglés como idioma principal del editor, sin embargo eres libre de elegir el de tu preferencia.

### Esquina superior izquierda
![left-top-corner](resources/editor_left_top_corner.png)

#### Local Projects
En esta parte podemos observar un panel de pestañas con una pestaña Local Projects que es donde podemos ver una lista con nuestros proyectos locales además de un panel de botones para la creación de nuevos proyectos, importación de proyectos, escaneo de directorios o carpetas donde tengamos guardados nuestros proyectos Godot; también contamos con otras opciones de edición de proyectos como editar, ejecutar, renombrar, manejar etiquetas, remover el proyecto de la lista de proyectos locales y remover todos los proyectos de la lista de proyectos que no hayan podido ser encontrados en sus directorios correspondientes debido a que hayan sido eliminados o se hayan movido a otro directorio, y ya por último al final del panel de opciones de edición de proyectos, podemos observar un bóton "Acerca de" qué nos provee de información sobre los desarrolladores del motor y las licencias que útiliza Godot.

![tab_local_projects](resources/tab_local_projects.png)

En Local Projects podemos observar también un campo de entrada de texto **Filter projects** donde podemos escribir el nombre de un proyecto que queramos buscar en la lista de proyectos, esto es muy útil para cuando tenemos una lista larga de proyectos y queremos acceder de forma rápida la proyecto. También podemos observar un menú desplegable **Sort** en el cuál podemos elegir el criterio en el que se deben ordenar los proyectos en la lista como ordenar por última modificación(Last modified), por nombre(Name), por ruta del directorio(path) y por etiquetas(Tags).

#### Asset Library Projects
Luego de las pestaña de Local Projects, podemos observar otra pestaña llamada Asset Library Projects:
![Tab asset library projects](resources/tab_asset_library_projects.png)

En esta pestaña nosotros podemos buscar recursos en línea que hayan subido otros desarrolladores, como librerías de utilidades para mejorar nuestra eficiencia a la hora de desarrollar videojuegos, demostraciones de proyectos en desarrollo y plantillas para ayudarnos a estructurar mejor nuestros proyectos.

### Creando un nuevo proyecto en Godot
Ahora que ya hemos visto una breve introducción a la interfaz gráfica del manejador de proyectos de Godot, veremos cómo crear nuestro primer proyecto en Godot.

Nos vamos a la pestaña Local Projects de Godot en el Project Manager y daremos click izquierdo sobre el botón de New Project:

![new_project_button](resources/new_project_button.png)

Nos aparecera una ventana emergente en la que debemos establecer algunas configuraciones y características de nuestro proyecto, como escribir el nombre de nuestro proyecto, establecer la ruta en la que se guardará, seleccionar la compatibilidad de renderizado y por último establecer si nuestro proyecto utilizará un controlador de versiones:

![project_creation_popup](resources/project_creation_popup.png)

Para crear nuestro proyecto en Godot debemos hacer lo siguiente:

1. Lo primero que haremos será darle un nombre al proyecto que vamos a crear, en nuestro caso Mi_primer_videojuego_en_godot.

2. Luego en Project Path damos click en **browse** para abrir el explorador de archivos y buscar el directorio en el que queremos guardar la carpeta de nuestro proyecto.

3. Una vez hemos buscado y seleccionado donde queremos que se guarde nuestro proyecto, daremos click izquierdo en el bóton **Create Folder** que nos creará la carpeta donde se guardará nuestro proyecto godot.

4. Luego en el apartado de Renderer, vamos a elegir una de las 3 opciones que nos da godot, dependiendo de las necesidades de las plataformas a las que queramos dar soporte de nuestro proyecto las opciones a elegir son las siguientes:
    - Forward+: 
        Marcando esta opción hará que en nuestro proyecto podamos utilizar opciones avanzadas para la creación de videojuegos 3D avanzados, pero reduce la compatibilidad de los pr
        oyectos a sólo plataformas de escritorio debido a la alta demanda de recursos a nivel de hardware que requieren este tipo de proyectos.
    - Mobile: 
        Marcando esta opción hará que en nuestro proyecto podamos darle soporte tanto a plataformas de escritorio y plataformas móviles, esta opción es mayormente recomendable para la creación de videojuegos 2D, se pueden también crear videojuegos 3D pero las opciones con las que contaremos serán limitadas debido a que su objetivo es dar el mayor rendimiento posible para poder ser compatible con plataformas moviles.
    - Compatibility: 
        Marcando esta opción hará que nuestro proyecto sea compatible con la mayoría de las plataformas como plataformas de escritorio, plataformas móviles, plataformas web e incluso soporte para dispositivos con pocos recursos a nivel de hardware. Principalmente está opción es utilizada para el desarrollo de videojuegos 2D con el objetivo de que sean compatibles con la mayoría de dispositivos y plataformas.

Recomiendo de estas 3 opciones utilizar la tercera opción **Compatibility** para la creación de videojuegos 2D, no sólo por tener un mayor margen de compatibilidad y si no porque si trabajamos en una computadora de pocos recursos nos evitaremos problemas de que no abren nuestros proyectos y cosas así.

5. Una vez ya hemos elegido el renderer que va a utilizar nuestro proyecto, podemos ver una opción en la que por defecto estará seleccionado el [sistema de control de versiones](https://es.wikipedia.org/wiki/Control_de_versiones) Git, lo dejaremos como está.

6. Una vez ya tenemos configurado nuestro proyecto, vamos a dar click izquierdo en el botón **Create & Edit**

Con esto ya tendríamos nuestro nuevo proyecto Godot creado y listo para comenzar a trabajar con él.

## Estructura de un proyecto Godot
Para poder trabajar con proyectos Godot, debemos primero conocer también cómo se estructuran y componen.

Los proyectos en Godot se estructuran en forma de carpetas, donde a su vez pueden contener más carpetas dependiendo del propósito o contenido que vaya a tener cada carpeta.
En los proyectos Godot, vamos a necesitar separar los componentes del proyecto en diferentes carpetas, tales como las escenas, los scripts, incluso los recursos multimedia de nuestros videojuegos como las texturas, iconos, los módelos 3D, sonidos, archivos de configuración, etc.

![basic_godot_project_structure](resources/basic_godot_project_structure.png)

Tal como podemos ver en esta imagen, así sería la estructura básica de un proyecto godot.

Podemos observar también un archivo project.godot; estos archivos básicamente guardan la información sobre la configuración de las propiedades de cada proyecto.

# Conclusión
En este artículo hemos aprendido a cómo descargar e instalar godot, a navegar en la interfaz gráfica del Project Manager, cómo crear un nuevo proyecto en Godot y cómo es la estructura básica de un proyecto en Godot.

## Siguiente artículo: Introducción a Nodos y Escenas
En el siguiente artículo aprenderemos sobre un tema bastante importante para el desarrollo de aplicaciones y videojuegos en Godot: **Nodos y Escenas**
Son los bloques de construcción con los cuáles construiremos toda la lógica de nuestras aplicaciones y videojuegos en Godot.

Siguiente artículo: [Godot 4: Introducción a Nodos y Escenas](articulo_3_nodos_y_escenas.md)