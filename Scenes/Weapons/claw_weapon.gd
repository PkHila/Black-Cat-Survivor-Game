extends Node2D

var dmg = 1
var current_animation = "attack1"
	
func _ready():
	$AnimationPlayer.play(current_animation)

func _on_timer_timeout():
	$AnimationPlayer.play(current_animation)


func _on_hitbox_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(dmg)


func _on_animation_player_animation_finished(anim_name):
	$hitbox/CollisionShape2D.disabled = true
	$AnimatedSprite2D.visible = false

func _on_animation_player_animation_started(anim_name):
	$hitbox/CollisionShape2D.disabled = false
	$AnimatedSprite2D.visible = false
