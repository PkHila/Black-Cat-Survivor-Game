extends Node2D

#@onready var player = get_node("/root/game_scene/Player")

@export var xp = 1
var speed : float = -1

@onready var collision = $CollisionShape2D
@onready var sprite = $Sprite2D
@onready var sound = $AudioStreamPlayer

var target = null

func _physics_process(delta):
	
	if target != null:
		global_position = global_position.move_toward(target.global_position, speed)
		speed += 5 * delta

func collect():
	sound.play()
	collision.call_deferred("set","disabled", true)
	sprite.visible = false
	return xp

func _on_audio_stream_player_finished():
	queue_free()
