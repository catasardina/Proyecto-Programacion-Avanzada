extends Control
func _on_atras_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_pantalla_completa_pressed() -> void:
		$VBoxContainer.visible = not $VBoxContainer.visible
		$FulleScream.visible = not $FulleScream.visible
		$ventana.visible = not $ventana.visible
