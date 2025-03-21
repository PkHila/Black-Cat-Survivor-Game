extends Button

var item = null
@onready var xp_manager = get_tree().get_first_node_in_group("xp_manager")

signal selected_upgrade(upgrade)

func _ready():
	connect("selected_upgrade", Callable(xp_manager, "upgrade_character"))
	
	

func _on_pressed():
	emit_signal("selected_upgrade", item)
