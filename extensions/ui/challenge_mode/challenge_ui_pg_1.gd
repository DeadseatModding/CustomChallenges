extends "res://ui/challenge_mode/challenge_ui_pg_1.gd"
## Replace built-in challenge and preset managers

const ZACKERYRSMITH_CC_DIR := "ZackeryRSmith-CustomChallenges"
var mod_dir_path := ModLoaderMod.get_unpacked_dir().path_join(
	ZACKERYRSMITH_CC_DIR
)

const CONTENT_VBOX_NODE_PATH = "MarginContainer/VBoxContainer/"
const TOP_ROW_NODE_PATH = CONTENT_VBOX_NODE_PATH + "top_row"
const MIDDLE_ROW_NODE_PATH = CONTENT_VBOX_NODE_PATH + "MarginContainer/middle_row"
const BOTTOM_ROW_NODE_PATH = CONTENT_VBOX_NODE_PATH + "bottom_row"

func _ready() -> void:
	var middle_row = get_node(MIDDLE_ROW_NODE_PATH)
	var first_node = middle_row.get_child(0)
	
	# remove old challenge manager
	var challenges_vbox = middle_row.get_node("VBoxContainer")
	middle_row.remove_child(challenges_vbox)
	
	var challenge_manager_path = mod_dir_path.path_join("content/challenge/challenge_manager.tscn")
	var challenge_manager = load(challenge_manager_path).instantiate()
	
	# add new challenge manager
	first_node.add_sibling(challenge_manager)
	
	var bottom_row = get_node(BOTTOM_ROW_NODE_PATH)
	var inner_hbox = bottom_row.get_node("HBoxContainer2")
	var gap = inner_hbox.get_node("gap")
	
	# remove old preset manager
	var presets_hbox = inner_hbox.get_node("HBoxContainer")
	inner_hbox.remove_child(presets_hbox)
	
	var preset_manager_path = mod_dir_path.path_join("content/preset/preset_manager.tscn")
	var preset_manager = load(preset_manager_path).instantiate()
	print(preset_manager)
	
	# add new preset manager
	gap.add_sibling(preset_manager)
	
	# TODO: This should really be added back at some point
	# remove challenge score
	var score_row = get_node(CONTENT_VBOX_NODE_PATH.path_join("MarginContainer2/score_row"))
	score_row.modulate.a = 0
	super()
