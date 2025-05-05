extends Control
func _on_atras_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_pantalla_completa_pressed() -> void:
	var vbox = get_node("TextureRect/PANTALLA COMPLETA/CanvasLayer/VBoxContainer")
	var fullscreen = get_node("TextureRect/PANTALLA COMPLETA/CanvasLayer/VBoxContainer/FulleScream")
	var ventana = get_node("TextureRect/PANTALLA COMPLETA/CanvasLayer/VBoxContainer/ventana")	
	
	vbox.visible = not vbox.visible
	fullscreen.visible = not fullscreen.visible
	ventana.visible = not ventana.visible
