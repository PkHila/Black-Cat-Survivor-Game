extends CanvasLayer

var lvl: int = 0
var xp_floor :int = 0
var lvl_ceiling :int = 10
var increment :int = 5

func _process(delta):
	var player_xp = $"../Player".xp
	var lvl_xp = player_xp - xp_floor 
	
	if lvl_xp > lvl_ceiling: #when level up
		lvl += 1
		xp_floor += lvl_ceiling
		lvl_ceiling += increment
		$ProgressBar.max_value = lvl_ceiling
		level_up()
	
	$ProgressBar.value = lvl_xp
	$Label.text = "Lvl.%d" % [lvl]

@onready var level_panel = get_node("%LvlScreen")
@onready var upgrade_options = get_node("%UpgradeOptions")
@onready var sound_lvlup = get_node("%sound_lvlup")
@onready var item_options = preload("res://Scenes/item_option.tscn")

func level_up():
	sound_lvlup.play()
	var tween = level_panel.create_tween()
	tween.tween_property(level_panel,"position", Vector2(375,80),0.2).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	tween.play()
	level_panel.visible = true
	select_upgrade()
	get_tree().paused = true
	

func select_upgrade():
	var options = 0
	var options_max = 3
	while options < options_max:
		var options_choice = item_options.instantiate()
		upgrade_options.add_child(options_choice)
		options += 1

func upgrade_character(upgrade):
	var option_children = upgrade_options.get_children()
	for i in option_children:
		i.queue_free()
	level_panel.visible = false
	level_panel.position = Vector2(1375,80)
	get_tree().paused = false
