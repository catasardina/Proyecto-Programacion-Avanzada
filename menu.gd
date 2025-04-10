extends Button


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://svgame.tscn")


func _on_op_pressed() -> void:
	get_tree().change_scene_to_file("res://opcion.tscn")



func _on_exit_pressed() -> void:
	get_tree().quit()
