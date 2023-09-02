extends CharacterBody2D

@onready var enemy_view: RayCast2D = $VisionArea/RayCast2D
@onready var spriteAnimation: AnimatedSprite2D = $AnimatedSprite2D

@export var choseSpeed: float = 90.0

var flipSprite = false

var isOutOfDetectZone: bool = true
var enemyIsLookingPlayer: bool = false

var playerNode: CharacterBody2D

func setEnemyPlayerTarget():
	var rayTargetVector: Vector2 = playerNode.position - position
	enemy_view.target_position = rayTargetVector

func checkViewObstacles():
	enemyIsLookingPlayer = !enemy_view.is_colliding()

func applyFriction():
	velocity *= 0.98

func moveEnemyToPlayer():
	var direction: Vector2 = ( playerNode.position - position ).normalized()
	flipSprite = velocity.x > 0.0	
	velocity += direction * 2.5	

func updateSpriteFlip():
	spriteAnimation.flip_h = flipSprite

func updateEnemyAnimation():
	updateSpriteFlip()

func onChosePlayer():
	#if !isOutOfDetectZone or enemyIsLookingPlayer:
	if !isOutOfDetectZone:
		setEnemyPlayerTarget()
		checkViewObstacles()		
		if enemyIsLookingPlayer:
			moveEnemyToPlayer()

func _physics_process(_delta):
	onChosePlayer()
	applyFriction()	
	updateEnemyAnimation()
	move_and_slide()

func _on_detection_zone_area_entered(area):
	if area.name == "hitbox_player":
		playerNode = area.get_parent()
		isOutOfDetectZone = false

func _on_detection_zone_area_exited(_area):
	if _area.name == "hitbox_player":
		isOutOfDetectZone = true
		

func _on_enemy_hitbox_area_entered(area):
	if area.name == "shot_hitbox":
		area.get_parent().explosion()
		queue_free()




