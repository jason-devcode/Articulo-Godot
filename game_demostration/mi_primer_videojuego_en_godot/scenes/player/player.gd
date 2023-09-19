extends CharacterBody2D

#######################################################################
# Código fuente del script para manejar las mecánicas y estados del jugador.
#
# Mecánicas implementadas en este código:
# 1. Mecánica de movimiento
# 2. Mecánica de salto
# 3. Actualización y reproducción de las animaciones
# de acuerdo al estado del jugador en un momento determinado.
# 4. Manejo de la señal de detección de áreas de la hitbox
######################################################################

# Factor de gravedad
@export var gravity: float = 20.0

# Velocidad máxima del personaje
@export var maxSpeed: float = 90.0

# Máxima altura que se puede alcanzar en un salto
@export var maxJumpHeight = 400.0

# Animación actual del personaje
@export var currentPlayerAnimation: String = "idle_animation"

# Variable para comprobar si el jugador está tocando el suelo
var isOnFloor: bool = false

# Variable para comprobar si el jugador se está moviendo
var playerIsMoving: bool = false

# Variable para comprobar la dirección del jugador y saber si se
# debe voltear horizontalmente la animación
var flip_horizontal_animation: bool = false

# Dirección del personaje
var direction: Vector2 = Vector2(0,0)

# Nodo del sprite del personaje
@onready var sprite: Sprite2D = $Sprite2D

# Nodo de animaciones del personaje
@onready var animations: AnimationPlayer = $AnimationPlayer

# Función para actualizar la dirección de avance del personaje en relación a las teclas
# que se hayan presionado.
func updatePlayerDirectionByInput():
	direction = Input.get_vector( "ui_left", "ui_right", "ui_up", "ui_down" )

# Función para manejar los eventos de entrada del teclado
func handleInputEvents():
	updatePlayerDirectionByInput()
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()

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

# Función para comprobar si el jugador se está moviendo
func checkPlayerIsMoving():
	return velocity.length() != 0.0 or !isOnFloor
	
# Función para parar la animación del personaje
func stopPlayerAnimation():
	animations.stop()

# Función para reproducir la animación actual del personaje
func playPlayerAnimation():
	animations.play(currentPlayerAnimation)

# Función para comprobar si la velocidad horizontal del
# jugador es diferente de cero.
func checkPlayerHorizontalVelocity():
	return velocity.x != 0.0

# Función para comprobar la dirección horizontal del jugador
func checkPlayerHorizontalDirection():
	if checkPlayerHorizontalVelocity():
		sprite.flip_h = velocity.x < 0.0

# Función para establecer la animación actual del jugador
func setPlayerCurrentAnimation( animationName: String = "idle" ):
	currentPlayerAnimation = animationName + "_animation"

# Función para comprobar y seleccionar la animación actual 
# del personaje en relación a su movimiento
func checkCurrentPlayerAnimation():
	if !checkPlayerIsMoving():
		setPlayerCurrentAnimation()
		return
	
	checkPlayerHorizontalDirection()
	
	if isOnFloor and checkPlayerHorizontalVelocity():
		setPlayerCurrentAnimation("walk")
		return
	
	setPlayerCurrentAnimation("jump")
	

# Función para actualizar las animaciones del personaje
func updatePlayerAnimations():
	checkCurrentPlayerAnimation()
	playPlayerAnimation()

# Función que se encarga del proceso físico del personaje
func _physics_process(_delta):
	handleInputEvents()
	updatePlayerState()
	updatePlayerVelocity()
	updatePlayerAnimations()
	updatePlayerPhysics()
	move_and_slide()

# Función que se encarga de manejar la señal emitida
# por el nodo de la hitbox al nodo del jugador.
func _on_hitbox_player_area_entered(area):
	# Detectar sólo las áreas de las hitbox de los enemigos
	if area.name == "hitbox_enemy":
		get_tree().reload_current_scene()

