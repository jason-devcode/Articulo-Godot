extends Node2D

@onready var menuAudioTheme: AudioStreamPlayer = $AudioStreamPlayer

func handleInput():
	if Input.is_key_pressed( KEY_ESCAPE ):
		get_tree().change_scene_to_file( "res://scenes/gui/menu.tscn" )

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	handleInput()

func _on_audio_stream_player_finished():
	menuAudioTheme.play()
