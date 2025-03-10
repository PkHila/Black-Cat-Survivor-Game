extends CharacterBody2D

signal health_depleted

var health: float = 100.0
var xp: int = 0

@export var movement_speed : float = 500
var character_direction : Vector2

#@onready var exp_obj = get_node("/root/game_scene/exp_obj")

func _physics_process(delta):
	
	#control movement
	character_direction.x = Input.get_axis("move_left","move_right")
	character_direction.y = Input.get_axis("move_up","move_down")
	character_direction = character_direction.normalized()
	
	#take damage
	const DAMANGE_RATE = 5.0
	var overlapping_mobs = %hurtbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMANGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
	
	
	#flip
	if character_direction.x > 0: %Sprite.flip_h = false
	elif character_direction.x < 0: %Sprite.flip_h = true
	
	#animation
	if character_direction:
		velocity = character_direction * movement_speed
		if %Sprite.animation != "Walking": %Sprite.animation = "Walking"
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		if %Sprite.animation != "Idle": %Sprite.animation = "Idle"
		
	move_and_slide()


#attract XP
func _on_grab_area_area_entered(area):
	if area.is_in_group("loot"):
		area.target = self

#collect XP
func _on_collection_area_area_entered(area):
	if area.is_in_group("loot"):
		var gem_xp = area.collect()
		xp += gem_xp
		print("Xp: ", xp)
