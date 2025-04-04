extends Node2D

func spawn_enemy():
	var new_enemy = preload("uid://c6yq80ueqspqp").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_enemy.global_position = %PathFollow2D.global_position
	add_child(new_enemy)
	

func _on_timer_timeout():
	spawn_enemy()


func _on_player_health_depleted():
	%GameOverScreen.visible = true
	get_tree().paused = true
	%BG_Music.stop()

func _on_screen_timer_victory_condition():
	%WinScreen.visible = true
	get_tree().paused = true
	%BG_Music.stop()
	
