extends Node2D

func take_damage(dmg):
	var drop = preload("uid://cjujgfrwp278e").instantiate()
	drop.global_position = global_position
	get_parent().call_deferred("add_child", drop)
	queue_free()
