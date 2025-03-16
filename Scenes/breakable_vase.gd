extends Node2D

func take_damage():
	var drop = preload("res://Scenes/food_item.tscn").instantiate()
	drop.global_position = global_position
	get_parent().call_deferred("add_child", drop)
	queue_free()
