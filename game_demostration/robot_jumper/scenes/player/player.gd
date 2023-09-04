extends CharacterBody2D

# Available animations:
# Idle animation -> idle_animation
# Walk animation -> walk_animation
# Jump animation -> jump_animation

@export var gravity: float = 20.0
@export var jumpVelocity: float = -200.0
@export var speedMovement: float = 110.0

@onready var sprite: Sprite2D = $Sprite2D
@onready var animations: AnimationPlayer = $AnimationPlayer

@onready var shotSpawnPoint: Marker2D = $shot_spawnpoint

@onready var ShotClass = preload( "res://scenes/player/shot.tscn" )

var isOnFloor : bool = false
var flipSprite: bool = false
var isPlayerShooting: bool = true

var direction: Vector2 = Vector2(0,0)
var currentPlayerAnimation: String = "idle_animation"

var spawnPoint: Vector2

func _ready():
	spawnPoint = position

func setPlayerSpawnPoint( point: Vector2 ):
	spawnPoint = point

func respawnPlayer():
	position = spawnPoint

func checkIsPlayerShootingAnimation():
	if isPlayerShooting: 
		currentPlayerAnimation += "_shooting"		

func changePlayerAnimation( animationName: String = "idle_animation" ):
	currentPlayerAnimation = animationName

func choseIdleAnimation():
	changePlayerAnimation()
	
func choseJumpAnimation():
	changePlayerAnimation( "jump_animation" )
	
func choseWalkAnimation():
	changePlayerAnimation( "walk_animation" )

func getInputDirection():
	direction = Input.get_vector( "ui_left", "ui_right", "ui_up", "ui_down" )
	
	if Input.is_key_pressed( KEY_SPACE ):
		if !isPlayerShooting:
			var shot = ShotClass.instantiate()
			shot.setInitProps( position, shotSpawnPoint.position, flipSprite )
			get_parent().add_child(shot)
			isPlayerShooting = true
	else:
		isPlayerShooting = false
		
func checkInputDirection():
	return direction.length() != 0.0

func onJumpEvent():
	if isOnFloor:
		velocity.y += jumpVelocity
		choseJumpAnimation()

func handleDirectionEvents():
	if direction.length() != 0.0:
		if direction.x != 0.0:
			flipSprite = direction.x < 0.0
		if direction.y < 0.0:
			onJumpEvent()

func handleInput():
	getInputDirection()
	handleDirectionEvents()
	velocity.x = speedMovement * direction.x	

func playPlayerAnimation():
	animations.play( currentPlayerAnimation )

func stopPlayerAnimation():
	if animations.is_playing():
		animations.stop()

func checkPlayerMovement():
	return velocity.length() != 0.0

func updateHorizontalFlipSprite():
	sprite.flip_h = flipSprite	

func updateAnimationByMovement():
	if checkPlayerMovement():
		if isOnFloor:
			choseWalkAnimation()
			return
		choseJumpAnimation()
		return
	if isOnFloor:
		choseIdleAnimation()

func updatePlayerAnimation():
	updateHorizontalFlipSprite()
	updateAnimationByMovement()
	checkIsPlayerShootingAnimation()
	playPlayerAnimation()

func applyGravity():
	if !isOnFloor: velocity.y += gravity

func checkIsOnFloor():
	isOnFloor = is_on_floor()

func handlePlayerPhysics():
	checkIsOnFloor()
	applyGravity()

func _physics_process(_delta):
	handleInput()
	handlePlayerPhysics()
	updatePlayerAnimation()
	move_and_slide()

# Para la parte de la detección de enemigos y la KillZone
# Function that is called when hitbox area 
# node send a signal when is entered in another area
func _on_hitbox_area_entered(area):
	if area.name == "KillZone":
		respawnPlayer()
		return
	if area.name == "enemy_hitbox":
		respawnPlayer()		






