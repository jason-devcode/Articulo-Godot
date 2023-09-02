extends Node2D

const RIGHT_DIRECTION =  1
const LEFT_DIRECTION  = -1

@export var MAX_REACH_DISTANCE: float = 200.0
@export var MAX_SPEED: float = 300.0

var shotDirection: int = RIGHT_DIRECTION

var currentDistanceTraveled: float = 0.0
var currentVariation: float = 0.0

func updatePositionVariation( delta ):
	currentVariation = MAX_SPEED * delta
	
func updatePosition():
	position.x += currentVariation * shotDirection

func updateDistanceTraveled():
	currentDistanceTraveled += currentVariation

func explosion():
	$AnimatedSprite2D.play("explosion")
	await $AnimatedSprite2D.animation_finished
	queue_free()

func checkDistanceTraveled():
	if currentDistanceTraveled > MAX_REACH_DISTANCE:
		explosion()
		
func checkCollision():
	if $RayCast2D.is_colliding():
		explosion()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	updatePositionVariation( delta )
	updatePosition()
	updateDistanceTraveled()
	checkDistanceTraveled()
	checkCollision()

func setShotDirection( isLeftDirection: bool ):
	if isLeftDirection:
		shotDirection = LEFT_DIRECTION

func setInitProps( worldPosition: Vector2, offsetPosition: Vector2, direction: bool ):
	setShotDirection( direction )
	if direction:
		offsetPosition.x *= -1
		$RayCast2D.target_position *= -1
	setInitPosition( worldPosition + offsetPosition )
	
func setInitPosition( shotSpawnPoint: Vector2 ):
	position = shotSpawnPoint
	




