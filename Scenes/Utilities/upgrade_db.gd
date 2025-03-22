extends Node


const ICON_PATH = "res://Sprites/Icons/"
const UPGRADES = {
	"magicWand1": {
		"icon": ICON_PATH + "projectile_weapon_icon.png",
		"displayName": "Magic Wand",
		"details": "Shoots a projectile that automatically tracks a nearby enemy",
		"level": "Lvl. 1",
		"preRequisite": [],
		"type": "weapon"
	},
	"magicWand2": {
		"icon": ICON_PATH + "projectile_weapon_icon.png",
		"displayName": "Magic Wand 2",
		"details": "Increases the reach of the wand's projectiles",
		"level": "Lvl. 2",
		"preRequisite": ["magicWand1"],
		"type": "weapon"
	},
	"magicWand3": {
		"icon": ICON_PATH + "projectile_weapon_icon.png",
		"displayName": "Magic Wand 3",
		"details": "Shoot projectiles faster",
		"level": "Lvl. 3",
		"preRequisite": ["magicWand2"],
		"type": "weapon"
	},
	"magicWand4": {
		"icon": ICON_PATH + "projectile_weapon_icon.png",
		"displayName": "Magic Wand 4",
		"details": "Projectiles do more damage",
		"level": "Lvl. 4",
		"preRequisite": ["magicWand3"],
		"type": "weapon"
	},
	"claws1": {
		"icon": ICON_PATH + "claw_weapon_icon.png",
		"displayName": "Claw Attack 1",
		"details": "Perform a melee slash to the left and right of your character",
		"level": "Lvl. 1",
		"preRequisite": [],
		"type": "weapon"
	},
	"claws2": {
		"icon": ICON_PATH + "claw_weapon_icon.png",
		"displayName": "Claw Attack 2",
		"details": "Attack becomes faster",
		"level": "Lvl. 2",
		"preRequisite": ["claws1"],
		"type": "weapon"
	},
	"claws3": {
		"icon": ICON_PATH + "claw_weapon_icon.png",
		"displayName": "Claw Attack 3",
		"details": "Attack becomes faster",
		"level": "Lvl. 3",
		"preRequisite": ["claws2"],
		"type": "weapon"
	},
	"claws4": {
		"icon": ICON_PATH + "claw_weapon_icon.png",
		"displayName": "Claw Attack 4",
		"details": "Double the damage of the claws",
		"level": "Lvl. 4",
		"preRequisite": ["claws5"],
		"type": "weapon"
	},
	"magicEye1": {
		"icon": ICON_PATH + "cat_eye_icon.png",
		"displayName": "Magic Eye 1",
		"details": "Powerful magic eye circles around you, dealing damage to enemies",
		"level": "Lvl. 1",
		"preRequisite": [],
		"type": "weapon"
	},
	"magicEye2": {
		"icon": ICON_PATH + "cat_eye_icon.png",
		"displayName": "Magic Eye 2",
		"details": "Have the magic eye rotate for a longer duration",
		"level": "Lvl. 2",
		"preRequisite": ["magicEye1"],
		"type": "weapon"
	},
	"magicEye3": {
		"icon": ICON_PATH + "cat_eye_icon.png",
		"displayName": "Magic Eye 3",
		"details": "Increase the damage of the eye",
		"level": "Lvl. 3",
		"preRequisite": ["magicEye2"],
		"type": "weapon"
	},
	"magicEye4": {
		"icon": ICON_PATH + "cat_eye_icon.png",
		"displayName": "Magic Eye 4",
		"details": "Decrease the cooldown of the attack",
		"level": "Lvl. 4",
		"preRequisite": ["magicEye3"],
		"type": "weapon"
	},
	"food": {
		"icon": ICON_PATH + "food_icon.png",
		"displayName": "Food",
		"details": "Heal a third of your HP",
		"level": "N/A",
		"preRequisite": [],
		"type": "item"
	}
}
