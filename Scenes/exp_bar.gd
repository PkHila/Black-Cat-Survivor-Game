extends CanvasLayer

var lvl: int = 0

func _process(delta):
	var player_xp = $"../Player".xp
	if player_xp >= (lvl + 1) * 10: #Every multiple of 10, lvl increases
		lvl += 1
		print("Level: ", lvl)
	var lvl_xp = player_xp - lvl * 10 #Every multiple of 10, lvl_xp resets for the progress bar
	
	$ProgressBar.value = lvl_xp
	$Label.text = "Lvl.%d" % [lvl]


	
