extends Area2D

var target_locked = false
var speed = 100
var dmg = 1

func _physics_process(delta):
	var a = $CollisionShape2D
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		target_locked = true
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)
	else:
		target_locked = false

func shoot():
	const PROJECTILE = preload("uid://1c3gt5rxawan")
	var new_projectile = PROJECTILE.instantiate()
	new_projectile.global_position = %ShootingPoint.global_position
	new_projectile.global_rotation = %ShootingPoint.global_rotation
	new_projectile.speed = speed
	new_projectile.dmg = dmg
	%ShootingPoint.add_child(new_projectile)

func _on_timer_timeout():
	if target_locked == true:
		shoot()
