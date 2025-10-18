extends HBoxContainer

const PRESETS_PER_PAGE: int = 8
const PresetButtonScene = preload("ui/preset_button.tscn")

@onready var CC = ModLoader.get_node("ZackeryRSmith-CustomChallenges")
@onready var page_up: Button = $IncrementButton
@onready var page_down: Button = $DecrementButton
@onready var presets: HBoxContainer = $Presets

var current_page: int = 1:
	set(value):
		current_page = clamp(value, 1, upper_page)
		check_button_visibility()
		_update_page()
var upper_page: int = 1:
	set(value):
		upper_page = max(1, value)
		current_page = clamp(current_page, 1, upper_page)

func _ready() -> void:
	upper_page = ceil(len(CC.presets) / float(PRESETS_PER_PAGE))
	
	page_up.pressed.connect(func(): current_page += 1)
	page_down.pressed.connect(func(): current_page -= 1)
	
	check_button_visibility()
	_update_page()

func _update_page() -> void:
	# clear presets
	for child in presets.get_children():
		child.free()
	
	var starting_index = (PRESETS_PER_PAGE * (current_page - 1))
	print(CC.presets.keys())
	var presets_on_page = CC.presets.keys().slice(starting_index, starting_index + PRESETS_PER_PAGE)
	for preset_name in presets_on_page:
		var preset_button = PresetButtonScene.instantiate()
		preset_button.preset = CC.presets.get(preset_name)
		presets.add_child(preset_button)

func check_button_visibility() -> void:
	if current_page == upper_page:
		page_up.modulate.a = 0
		page_up.disabled = true
	else:
		page_up.modulate.a = 1
		page_up.disabled = false
	
	if current_page == 1:
		page_down.modulate.a = 0
		page_down.disabled = true
	else:
		page_down.modulate.a = 1
		page_down.disabled = false
