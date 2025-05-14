extends Control



func _on_back_to_menu_button_pressed():
	get_tree().paused = false  # por si el juego está pausado
	get_tree().change_scene_to_file("res://menu.tscn")
	
	
