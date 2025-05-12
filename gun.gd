extends Area2D


func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPart.global_position
	
	# Calcular dirección en base a rotación del ShootingPart
	var angle = %ShootingPart.global_rotation
	new_bullet.rotation = angle  # opcional, para que la sprite de la bala se oriente
	new_bullet.direction = Vector2.RIGHT.rotated(angle)
	new_bullet.is_enemy_bullet = false
	new_bullet.shooter = self
	get_tree().current_scene.add_child(new_bullet)
