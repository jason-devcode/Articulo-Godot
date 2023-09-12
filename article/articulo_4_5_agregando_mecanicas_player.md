# Godot Engine 4: Crea tú primer videojuego con Godot Engine 4 desdé cero
## Parte 5: Agregando mecánicas a nuestro personaje

- [Introducción](#introducción)
- [Asignando un script a nuestro personaje](#Asignando-un-script-a-nuestro-personaje)
- [Script de la lógica programada de las mecánicas de movimiento y salto](#script-de-la-lógica-programada-de-las-mecánicas-de-movimiento-y-salto)
- [Animando a nuestro personaje](#animando-a-nuestro-personaje)
- [Agregando la animación de caminar y saltar](#agregando-la-animación-de-caminar-y-saltar)
- [Agregando una hitbox a nuestro personaje](#agregando-una-hitbox-a-nuestro-personaje)
- [Respondiendo a señales](#respondiendo-a-señales)
- [Script completo](#script-completo)
- [Conclusión](#conclusión)

### Introducción
Ahora que ya hemos creado y diseñado el mapa de la escena mundo de nuestro videojuego y tenemos a nuestro personaje posicionado en el mapa, vamos a añadir las mecánicas de nuestro personaje, la mécanica del movimiento con las teclas, mecánica de salto y una hitbox para que nuestro personaje pueda detectar cuando colisiona con un enemigo.

### Asignando un script a nuestro personaje

Primero vamos a asignar el script el cual contendrá la lógica programada en **GDScript** de las mecánicas de nuestro personaje, para eso debemos abrir la escena player de nuestro personaje:

![select_player_scene_for_add_script](resources/select_player_scene_for_add_script.png)

Una vez hemos abierto la escena player de nuestro personaje, vamos a asignarle un script, para eso nos iremos al panel de edición de escenas **Scene**, buscaremos en la lista de nodos que hemos creado en la escena Player de nuestro personaje el nodo Player o CharacterBody2D si no le hemos cambiado el nombre, daremos click derecho sobre ese nodo y en el menú que nos desplega vamos a buscar la opción **Attach Script**:

![attach_script_player_scene](resources/attach_script_player_scene.png)

Daremos click izquierdo sobre esa opción y nos aparecerá una ventana como la siguiente:

![attach_script_popup_window](resources/attach_script_popup_window.png)

Dejaremos todo como está y simplemente daremos click izquierdo sobre el botón **Create** y nos debería aparecer el editor de scripts de la siguiente manera:

![script_editor_after_click_create_button](resources/script_editor_after_click_create_button.png)

Nos aparecerá el código fuente de un script con la lógica programada en GDScript de algunas mecánicas, como mover al personaje mediante el teclado y saltar, sin embargo en el script que programaremos no vamos a utilizar ese mismo código, en su lugar usaremos el que he programado para este artículo, así que vamos a borrar todo ese código, simplemente presionando las teclas ctrl+A seguido de la tecla de borrar o retroceso.

### Script de la lógica programada de las mecánicas de movimiento y salto

Para agregar la mecánica de movimiento y salto al script, vamos a añadir el siguiente código fuente en el script:

```gdscript
extends CharacterBody2D

#######################################################################
# Código fuente del script para las mecánicas del jugador.
#
# Mecánicas implementadas en este código:
# 1. Mecánica de movimiento
# 2. Mecánica de salto
######################################################################


# Factor de gravedad
@export var gravity: float = 20.0

# Velocidad máxima del personaje
@export var maxSpeed: float = 90.0

# Máxima altura que se puede alcanzar en un salto
@export var maxJumpHeight = 400.0

# Variable para comprobar si el jugador está tocando el suelo
var isOnFloor: bool = false

# Dirección del personaje
var direction: Vector2 = Vector2(0,0)

# Función para actualizar la dirección de avance del personaje en relación a las teclas
# que se hayan presionado.
func updatePlayerDirectionByInput():
	direction = Input.get_vector( "ui_left", "ui_right", "ui_up", "ui_down" )

# Función para manejar los eventos de entrada del teclado
func handleInputEvents():
	updatePlayerDirectionByInput()

# Actualiza las variables que indican en que estado se encuentra el personaje
func updatePlayerState():
	isOnFloor = is_on_floor()

# Función para realizar la acción de salto
func performJumpAction():
	velocity.y -= maxJumpHeight

# Función para actualizar sólo la velocidad horizontal
func updateHorizontalPlayerVelocity():
	velocity.x = direction.x * maxSpeed

# Función para actualizar sólo la velocidad vertical
# acá se implementa la mecánica de salto.
func updateVerticalPlayerVelocity():
	if isOnFloor and direction.y < 0.0:
		performJumpAction()

# Función para actualizar la velocidad del personaje
func updatePlayerVelocity():
	updateHorizontalPlayerVelocity()
	updateVerticalPlayerVelocity()

# Función para aplicar el factor de gravedad
func applyGravity():
	velocity.y += gravity

# Función para actualizar la física de nuestro personaje
func updatePlayerPhysics():
	if !isOnFloor:
		applyGravity()

# Función que se encarga del proceso físico del personaje
func _physics_process(_delta):
	handleInputEvents()
	updatePlayerState()
	updatePlayerVelocity()
	updatePlayerPhysics()
	move_and_slide()

```

En este artículo no se explicará a detalle cada parte de este código, sin embargo he tratado de documentar con comentarios dando una descriptción simple de lo que hace cada función y variable del código.

### Probando el funcionamiento del script

Una vez hemos copiado ese código fuente a nuestro script, lo que haremos ahora será probar su funcionamiento, para eso primero debemos guardar los cambios en nuestro script presionando las teclas ctrl+s, luego nos iremos a la parte superior derecha del editor y encontraremos la siguiente barra de botones:

![play_scene_bar_buttons](resources/play_scene_bar_buttons.png)

Daremos click izquierdo sobre el botón de play ![play_scene_button](resources/play_scene_button.png), luego nos debería de aparecer la siguiente ventana emergente en la cuál se nos pide seleccionar la escena principal en la que debe iniciar nuestro videojuego:

![select_scene_to_play_window_popup](resources/select_scene_to_play_window_popup.png)

Nosotros seleccionaremos la escena del mundo de nuestro videojuego, para eso daremos click izquierdo sobre el botón **Select**, luego nos aparecerá una ventana del explorador de archivos, lo que debemos hacer será buscar el archivo **world.tscn** de la escena de mundo y seleccionarlo:

![select_and_play_world_scene](resources/select_and_play_world_scene.gif)

Como podemos observar, una vez seleccionamos el archivo **world.tscn** de la escena de mundo de nuestro videojuego, se comenzará a ejecutar la escena World donde podremos probar el funcionamiento de la lógica programada de las mecánicas de nuestro jugador.

El proceso de seleccionar la escena mundo como la escena principal desdé donde se comenzará a ejecutar nuestro videojuego sólo se hace una única vez, la próxima vez que demos click izquierdo sobre el botón play ![play_scene_button](resources/play_scene_button.png) para ejecutar, ya sólo se comenzará a ejecutar automáticamente desdé la escena que hemos seleccionado como escena de ejecución principal que en este caso es la escena World.


### Animando a nuestro personaje - Animación de caminar

Ahora que ya sabemos ejecutar nuestro videojuego desde la escena mundo para probar las mecánicas que hemos implementado en el script del personaje, podemos proseguir a implementar las animaciones de nuestro personaje.

Para comenzar a trabajar en las animaciones de nuestro personaje, seleccionaremos el editor de escenas 2D, para eso nos iremos a la parte superior del editor:

![select_2d_editor_from_script_editor](resources/select_2d_editor_from_script_editor.png)

Y daremos click izquierdo en **2D** para seleccionar el editor de escenas 2D.

Para poder crear las animaciones de nuestro personaje, vamos a necesitar un nuevo nodo de tipo AnimationPlayer:

![adding_animationplayer_node](resources/adding_animationplayer_node.png)

Este nodo básicamente lo que hace es guardar la información de las animaciones de nuestro personaje, como el nombre de cada animación, el tiempo de duración total; la cantidad, la organización y la duración de cada frame, etc.

Una vez hemos agregado el nodo AnimationPlayer a nuestro personaje, lo que haremos será crear una nueva animación.

Para eso primero daremos click izquierdo sobre el nodo AnimationPlayer, eso hará que nos aparezca el siguiente panel de edición de animaciones:

![select_animationplayer_node](resources/select_animationplayer_node.gif)

Ahora nos iremos a ese panel de edición de animaciones y daremos click izquierdo en el botón **Animation** que nos desplegará una lista de opciones:

![click_animation_button](resources/click_animation_button.png)

Daremos click en la opción de **New** para crear una nueva animación y nos debería aparecer una ventana en la cuál debemos ingresar el nombre de la nueva animación y dar click izquierdo sobre el botón **OK**:

![write_animation_name](resources/write_animation_name.png)

En este caso le he puesto **walk_animation** que será la animación de caminar de nuestro personaje, luego de darle click izquierdo al botón **OK** debería aparecernos el panel de edición de animaciones de la siguiente forma:

![animation_panel_after_new_animation](resources/animation_panel_after_new_animation.png)

Una vez hemos creado la nueva animación **walk_animation**, vamos a crear la pista o **track** de frames que compondrá la animación de caminar de nuestro personaje. Para eso, teniendo seleccionado el nodo AnimationPlayer y el panel de edición de nodos abierto en la animación que creamos de **walk_animation**,
nos iremos al panel de edición de escena **Scene** y seleccionaremos el nodo Sprite2D que habíamos creado para darle apariencia a nuestro personaje, nos debería quedar de la siguiente forma:

![select_node_sprite2d_player_animation](resources/select_node_sprite2d_player_animation.png)

Nos fijaremos en la siguiente sección del panel **inspector**:

![inspector_panel_frame_animation_editor](resources/inspector_panel_frame_animation_editor.png)




### Agregando una hitbox a nuestro personaje
### Respondiendo a señales
### Script completo
### Conclusión
### Siguiente Parte
