extends Area2D

var speed = 100
var travelled_distance = 0
var dmg = 1

func _physics_process(delta):
	const RANGE = 1200
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta #delta makes it by affected by time rather than frames
	
	#destroy the bullet when it's too far
	travelled_distance += speed * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(dmg)
