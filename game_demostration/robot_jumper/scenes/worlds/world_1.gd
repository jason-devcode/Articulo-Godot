extends Node2D

@onready var menuAudioTheme: AudioStreamPlayer = $AudioStreamPlayer

@onready var playerSpawnPoint: Vector2 = $TileMap/PlayerSpawnPoint.position

@onready var PlayerClass = preload("res://scenes/player/player.tscn")

@onready var tilemap: TileMap = $TileMap

func _ready():
	var player = PlayerClass.instantiate()
	var camera = Camera2D.new()
	camera.zoom = Vector2( 2 , 2 )
	camera.limit_left = 0

	tilemap.add_child( player )		
	player.setPlayerSpawnPoint( playerSpawnPoint )
	player.respawnPlayer()
	player.add_child( camera )

func handleInput():
	if Input.is_key_pressed( KEY_ESCAPE ):
		get_tree().change_scene_to_file( "res://scenes/gui/menu.tscn" )

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	handleInput()

func _on_audio_stream_player_finished():
	menuAudioTheme.play()
