extends CanvasLayer

func _process(delta):
	testEsc()

func resume():
	get_tree().paused = false
	visible = false

func pause():
	get_tree().paused = true
	visible = true
	
func testEsc():
	if Input.is_action_just_pressed("Pause") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("Pause") and get_tree().paused:
		resume()


func _on_resume_button_pressed():
	resume()

func _on_restart_button_pressed():
	resume()
	get_tree().reload_current_scene()

func _on_quit_button_pressed():
	pass # TODO: Replace with a function to go to title screen
