extends Node2D

signal victory_condition
@onready var total_timer_seconds : int = 0
const MAXTIME : int = 120

func _ready():
	%Timer.start()
	
func _on_timer_timeout():
	
	total_timer_seconds += 1
	var mins = int(total_timer_seconds / 60)
	var secs = total_timer_seconds - mins * 60
	
	%Label.text = '%02d:%02d' % [mins, secs]
	
	if(total_timer_seconds == MAXTIME):
		emit_signal("victory_condition")
		%Timer.stop()
		
	
