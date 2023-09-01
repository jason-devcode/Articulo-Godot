extends Control

const MAX_NUM_WORLDS = 1

@onready var sceneTree: SceneTree = get_tree()
@onready var startButton: Button = $VBoxContainer/start_button
@onready var menuAudioTheme: AudioStreamPlayer = $AudioStreamPlayer

@export var currentWorldLevel = 1

func get_world_path_by_index( index: int ):
	return "res://scenes/worlds/world_" + str( index ) + ".tscn"

func _ready():
	startButton.grab_focus()

func _on_start_button_pressed():
	var worldPath: String = get_world_path_by_index( currentWorldLevel )
	sceneTree.change_scene_to_file( worldPath )

func _on_select_world_button_pressed():
	print( get_world_path_by_index(1) )

func _on_quit_button_pressed():
	sceneTree.quit()

func _on_audio_stream_player_finished():
	menuAudioTheme.play()
