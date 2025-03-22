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
@onready var item_options = preload("uid://bq2jbfvd336vg")

func level_up():
	sound_lvlup.play()
	var tween = level_panel.create_tween()
	tween.tween_property(level_panel,"position", Vector2(375,80),0.2).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	tween.play()
	level_panel.visible = true
	select_upgrade()
	get_tree().paused = true
	
#UPGRADES
var collected_upgrades = []
var upgrade_list = []

func select_upgrade():
	var options = 0
	var options_max = 3
	while options < options_max:
		var options_choice = item_options.instantiate()
		options_choice.item = get_random_item()
		upgrade_options.add_child(options_choice)
		options += 1

@onready var player = $"../Player"
var claw_weapon_preload = preload("uid://bauf18vsip4af")
var eye_weapon_preload =  preload("uid://bls0goxqsnxsa")

func upgrade_character(upgrade):
	
	match upgrade:
		"magicWand1":
			pass
		"claws1":
			var claw_weapon = claw_weapon_preload.instantiate()
			player.add_child(claw_weapon ,false,Node.INTERNAL_MODE_DISABLED)
		"magicEye1":
			var eye_weapon = eye_weapon_preload.instantiate()
			player.add_child(eye_weapon ,false,Node.INTERNAL_MODE_DISABLED)
	
	var option_children = upgrade_options.get_children()
	for i in option_children:
		i.queue_free()
	upgrade_list.clear()
	collected_upgrades.append(upgrade)
	level_panel.visible = false
	level_panel.position = Vector2(1375,80)
	get_tree().paused = false

func get_random_item():
	var db_list = []
	for i in UpgradeDb.UPGRADES:
		if i in collected_upgrades || i in upgrade_list: #if it already exists in inventory or menu
			pass
		elif UpgradeDb.UPGRADES[i]["type"] == "item": #we pass on food, as it is already the default
			pass
		elif UpgradeDb.UPGRADES[i]["preRequisite"].size() > 0:
			for n in UpgradeDb.UPGRADES[i]["preRequisite"]:
				if not n in collected_upgrades:
					pass
				else:
					db_list.append(i)
		else: 
			db_list.append(i)
			
	if db_list.size() > 0:
		var random_item = db_list.pick_random()
		upgrade_list.append(random_item)
		return random_item
	else:
		return null
	
