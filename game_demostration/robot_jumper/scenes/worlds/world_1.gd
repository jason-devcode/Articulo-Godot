extends Node2D

func handleInput():
	if Input.is_key_pressed( KEY_ESCAPE ):
		get_tree().change_scene_to_file( "res://scenes/gui/menu.tscn" )

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	handleInput()
