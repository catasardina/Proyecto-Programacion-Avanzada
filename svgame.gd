extends Node2D

var is_bullet_hell = false

func _ready() -> void:
	var player = get_node("Player")
	player.connect("request_bullet_hell", Callable(self, "_on_enter_bullet_hell"))
	player.connect("request_bullet_hell_end", Callable(self, "_on_exit_bullet_hell"))
	
func _on_enter_bullet_hell():
	is_bullet_hell = true
	var childs = get_children()
	
	for child in childs:
		if child is Mob:
			child.bullet_hell_mode = true
	
func _on_exit_bullet_hell():
	is_bullet_hell = false
	
	var childs = get_children()
	
	for child in childs:
		if child is Mob:
			child.bullet_hell_mode = false
	
func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout():
	if not is_bullet_hell:
		spawn_mob()
