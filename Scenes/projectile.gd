extends Area2D

@export var speed = 500
var travelled_distance = 0

func _physics_process(delta):
	const RANGE = 1200
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta #delta makes it by affected by time rather than frames
	
	#destroy the bullet when it's too far
	travelled_distance += speed * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	pass # Replace with function body.
