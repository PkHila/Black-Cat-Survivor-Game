extends Area2D

var target_locked = false

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		target_locked = true
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)
	else:
		target_locked = false

func shoot():
	const PROJECTILE = preload("res://Scenes/projectile.tscn")
	var new_projectile = PROJECTILE.instantiate()
	new_projectile.global_position = %ShootingPoint.global_position
	new_projectile.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_projectile)

func _on_timer_timeout():
	if target_locked == true:
		shoot()
