extends CanvasLayer

var lvl: int = 0
var xp_floor :int = 0
var xp_ceiling :int = 10
var increment :int = 5

func _process(delta):
	var player_xp = $"../Player".xp
	var lvl_xp = player_xp - xp_floor 
	print("Level_xp: ", lvl_xp)
	
	if lvl_xp > xp_ceiling: 
		lvl += 1
		xp_floor += xp_ceiling
		xp_ceiling += increment
		$ProgressBar.max_value = xp_ceiling
		print("Level: ", lvl)
	
	
	$ProgressBar.value = lvl_xp
	$Label.text = "Lvl.%d" % [lvl]


	
