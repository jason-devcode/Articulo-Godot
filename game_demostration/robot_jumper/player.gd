extends CharacterBody2D

@export var gravity: float = 15.0
@export var jumpVelocity: float = -200.0
@export var speedWalk: float = 80.0

@onready var sprite: Sprite2D = $Sprite2D
@onready var animations: AnimationPlayer = $AnimationPlayer

var currentPlayerAnimation: String = "walk_animation"

var flipSprite: bool = false
var isOnAir: bool = false

func getInputDirection():
	return Input.get_vector( "ui_left", "ui_right", "ui_top", "ui_down" )

func handleInput( delta ):
	var direction = getInputDirection()
	
	velocity.x = speedWalk * direction.x
	
	if velocity.length() > 0.0:
		flipSprite = velocity.x < 0.0
		if is_on_floor() and direction.y != 0:
			velocity.y += jumpVelocity

func playPlayerAnimation():
	animations.play( currentPlayerAnimation )
	
func stopPlayerAnimation():
	if animations.is_playing():
		animations.stop()
		
func checkPlayerMovement():
	return velocity.length() != 0.0

func updatePlayerAnimation():
	sprite.flip_h = flipSprite

	if checkPlayerMovement():
		playPlayerAnimation()
	else:
		stopPlayerAnimation()

func applyGravity():
	velocity.y += gravity

func handlePlayerPhysics():
	if !is_on_floor():
		applyGravity()

func _physics_process(delta):
	
	handleInput( delta )
	handlePlayerPhysics()
	updatePlayerAnimation()
	move_and_slide()
	
