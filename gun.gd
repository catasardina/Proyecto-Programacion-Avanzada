extends Area2D


func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPart.global_position
	new_bullet.global_rotation = %ShootingPart.global_rotation
	%ShootingPart.add_child(new_bullet)
