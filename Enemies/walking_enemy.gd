extends CharacterBody2D


@onready var player = get_node("/root/game_scene/Player")
@export var movement_speed : float = 80.0


func _physics_process(delta):
	var direction : Vector2 = global_position
	velocity = direction.direction_to(player.global_position) * movement_speed
	
	if velocity.x > 0: %Sprite.flip_h = false
	elif velocity.x < 0: %Sprite.flip_h = true
	
	move_and_slide()
