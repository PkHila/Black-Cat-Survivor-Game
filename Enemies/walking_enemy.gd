extends CharacterBody2D

@onready var player = get_node("/root/game_scene/Player")

@export var movement_speed : float = 80.0
@export var health = 2

func _physics_process(delta):
	var direction : Vector2 = global_position
	velocity = direction.direction_to(player.global_position) * movement_speed
	
	if velocity.x > 0: %Sprite.flip_h = false
	elif velocity.x < 0: %Sprite.flip_h = true
	
	move_and_slide()


func take_damage():
	health -= 1
	
	if health == 0:
		enemy_dies()
	$AnimationPlayer.play("take_damage")

func enemy_dies():
	drop_xp()
	queue_free()

func drop_xp():
	var new_xp = preload("res://Scenes/exp_obj.tscn").instantiate()
	new_xp.global_position = global_position
	get_parent().call_deferred("add_child", new_xp)
