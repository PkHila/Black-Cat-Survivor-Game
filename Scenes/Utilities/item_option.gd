extends Button

@onready var lbl_name = $Label_name
@onready var lbl_lvl = $Label_lvl
@onready var lbl_desc = $Label_desc
@onready var itemIcon = $ColorRect/Item_Icon



var item = null
@onready var xp_manager = get_tree().get_first_node_in_group("xp_manager")

signal selected_upgrade(upgrade)

func _ready():
	connect("selected_upgrade", Callable(xp_manager, "upgrade_character"))
	if item == null:
		item = "food"
	lbl_name.text = UpgradeDb.UPGRADES[item]["displayName"]
	lbl_lvl.text = UpgradeDb.UPGRADES[item]["level"]
	lbl_desc.text = UpgradeDb.UPGRADES[item]["details"]
	itemIcon.texture = load(UpgradeDb.UPGRADES[item]["icon"])
	

func _on_pressed():
	emit_signal("selected_upgrade", item)
