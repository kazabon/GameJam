extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/WorldScenes/test_level.tscn")


func _on_options_pressed():
	print("Options for volume and keybind go here!")


func _on_quit_pressed():
	get_tree().quit()

