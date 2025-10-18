extends HBoxContainer

const CHALLENGES_PER_PAGE: int = 10
const ChallengeButtonScene = preload("ui/challenge_button.tscn")

@onready var CC = ModLoader.get_node("ZackeryRSmith-CustomChallenges")
@onready var page_up: Button = $PageManager/IncrementButton
@onready var page_down: Button = $PageManager/DecrementButton
@onready var page_label: Label = $PageManager/PageLabel
@onready var challenges_grid = $Challenges/GridContainer

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
	upper_page = ceil(len(CC.challenges) / float(CHALLENGES_PER_PAGE))
	
	page_up.pressed.connect(func(): current_page += 1)
	page_down.pressed.connect(func(): current_page -= 1)
	
	SignalServer.update_challenge_buttons.connect(_update_page)
	check_button_visibility()

func _update_page() -> void:
	# clear grid
	for child in challenges_grid.get_children():
		child.free()
	
	var starting_index = (CHALLENGES_PER_PAGE * (current_page - 1))
	var challenges_on_page = CC.challenges.keys().slice(starting_index, starting_index + CHALLENGES_PER_PAGE)
	for challenge_name in challenges_on_page:
		var challenge_button = ChallengeButtonScene.instantiate()
		challenge_button.challenge = CC.challenges.get(challenge_name)
		challenges_grid.add_child(challenge_button)
	
	if page_label:
		page_label.text = "%s/%s" % [current_page, upper_page]

func check_button_visibility() -> void:
	page_up.modulate.a = 0 if current_page == upper_page else 1
	page_down.modulate.a = 0 if current_page == 1 else 1
