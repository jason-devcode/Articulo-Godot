extends CharacterBody2D

#######################################################################
# Código fuente del script para manejar las mecánicas y estados del enemigo.
#
# Mecánicas implementadas en este código:
# 1. Manejo de la señal de detección del jugador
# 2. Mecánica de movimiento con leyes de inercia y fricción
# 3. Mecánica de persecución
######################################################################

# Nodo del sprite del enemigo
@onready var sprite: Sprite2D = $Sprite2D

# Velocidad de persecución
@export var choseSpeed: float = 90.0

# Voltear el sprite horizontalmente dependiendo de la dirección
var flipSprite = false

# Variable para detectar si el jugador está en la zona
# de detección del jugador
var playerIsInDetectZone: bool = false

# Nodo del jugador para obtener su posición actual
var playerNode: CharacterBody2D

# Función para aplicar el factor de fricción a la velocidad del enemigo.
func applyFriction():
	velocity *= 0.98
	
# Función para mover al enemigo hacía el jugador
func moveEnemyToPlayer():
	var direction: Vector2 = ( playerNode.position - position ).normalized()
	flipSprite = velocity.x > 0.0	
	velocity += direction * 2.5	

func updateSpriteFlip():
	sprite.flip_h = flipSprite

# Función que se encarga de actualizar el estado del sprite 
# de acuerdo al estado del enemigo
func updateEnemySprite():
	updateSpriteFlip()

# Función que se encarga de hacer que el enemigo persiga al jugador
func chosePlayer():
	if playerIsInDetectZone:
		moveEnemyToPlayer()

# Función que se encarga del proceso físico del enemigo.
func _physics_process(_delta):
	chosePlayer()
	applyFriction()	
	updateEnemySprite()
	move_and_slide()

# Función que se encarga de manejar la señal emitida
# por el nodo del área de detección cuándo detectá al jugador.
func _on_detect_zone_area_entered(area):
	if area.name == "hitbox_player":
		playerNode = area.get_parent()
		playerIsInDetectZone = true
