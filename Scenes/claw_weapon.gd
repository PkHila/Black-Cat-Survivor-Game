extends Node2D

	
func _on_timer_timeout():
	$AnimationPlayer.play("new_animation")


func _on_hitbox_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage()


func _on_animation_player_animation_finished(anim_name):
	$hitbox/CollisionShape2D.disabled = true


func _on_animation_player_animation_started(anim_name):
	$hitbox/CollisionShape2D.disabled = false
