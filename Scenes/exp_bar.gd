extends CanvasLayer

var lvl: int = 0
var xp_floor :int = 0
var lvl_ceiling :int = 10
var increment :int = 5

func _process(delta):
	var player_xp = $"../Player".xp
	var lvl_xp = player_xp - xp_floor 
	
	if lvl_xp > lvl_ceiling: 
		lvl += 1
		xp_floor += lvl_ceiling
		lvl_ceiling += increment
		$ProgressBar.max_value = lvl_ceiling
		print("Level: ", lvl)
	
	
	$ProgressBar.value = lvl_xp
	$Label.text = "Lvl.%d" % [lvl]


	
