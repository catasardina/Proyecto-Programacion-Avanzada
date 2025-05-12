extends Node2D

var is_bullet_hell = false
var num_mob = 0

func _ready() -> void:
	var player = get_node("Player")
	player.connect("request_bullet_hell", Callable(self, "_on_enter_bullet_hell"))
	player.connect("request_bullet_hell_end", Callable(self, "_on_exit_bullet_hell"))
	
		#asigna el player a todos los mobs existentes ya colocados en el editor desde antes
	for child in get_children():
		if child is Mob:
			child.player = player
	
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
	if(num_mob < 10):
		var new_mob = preload("res://mob.tscn").instantiate()
		new_mob.connect("death", Callable(self, "mob_death"))
		%PathFollow2D.progress_ratio = randf()
		new_mob.global_position = %PathFollow2D.global_position
		
		#asignar el jugador al mob spawneado
		var player = get_node_or_null("Player")
		if player:
			new_mob.player = player
		else:
			print("no se encontró al jugador para asignarlo al mob")
		
		add_child(new_mob)
		num_mob += 1

func mob_death():
	num_mob -= 1
		
func _on_timer_timeout():
	if not is_bullet_hell:
		spawn_mob()
