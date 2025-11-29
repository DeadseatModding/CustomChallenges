extends Node
## Built-in challenges and presets
## 
## These must be re-added as CustomChallenges completely overhauls the challenge
## and preset systems. This makes use of `toggled_callback`s to emulate the base
## challenge / preset system. It keeps this mod quite a bit more compatiable. However,
## in most cases DO NOT USE TOGGLED CALLBACKS! Use CC.challenges.get("name").enabled

@onready var CC = ModLoader.get_node("ZackeryRSmith-CustomChallenges")

func _ready() -> void:
	#region Challenges
	var steering = CC.CustomChallenge.new()
	steering.name = "steering"
	steering.description = "Monster can attack from the front."
	steering.icon_default = CC.atlas("res://art/ui/challenge_mode/challenge_icons/Steering_Challenge.png", Rect2(0, 0, 32, 32))
	steering.icon_selected = CC.atlas("res://art/ui/challenge_mode/challenge_icons/Steering_Challenge.png", Rect2(32, 0, 32, 32))
	steering.toggled_callback = func(state: bool):
		Global.challenge_mode_settings.set(
			"challenge_steering_enabled",
			state
		)
	CC._add_builtin_challenge(steering)
	
	var monster_2d = CC.CustomChallenge.new()
	monster_2d.name = "monster_2d"
	monster_2d.description = "Enable monster in gamekyd."
	monster_2d.icon_default = CC.atlas("res://art/ui/challenge_mode/challenge_icons/Die_In_Game.png", Rect2(0, 0, 32, 32))
	monster_2d.icon_selected = CC.atlas("res://art/ui/challenge_mode/challenge_icons/Die_In_Game.png", Rect2(32, 0, 32, 32))
	monster_2d.toggled_callback = func(state: bool):
		Global.challenge_mode_settings.set(
			"challenge_enable_monster_2d",
			state
		)
	CC._add_builtin_challenge(monster_2d)
	
	var lose_gas = CC.CustomChallenge.new()
	lose_gas.name = "lose_gas"
	lose_gas.description = "Lose gas when hitting obstacles."
	lose_gas.icon_default = CC.atlas("res://art/ui/challenge_mode/challenge_icons/Gas_Leak.png", Rect2(0, 0, 32, 32))
	lose_gas.icon_selected = CC.atlas("res://art/ui/challenge_mode/challenge_icons/Gas_Leak.png", Rect2(32, 0, 32, 32))
	lose_gas.toggled_callback = func(state: bool):
		Global.challenge_mode_settings.set(
			"challenge_lose_gas",
			state
		)
	CC._add_builtin_challenge(lose_gas)
	
	var red_eyes = CC.CustomChallenge.new()
	red_eyes.name = "red_eyes"
	red_eyes.description = "Enable red eyes."
	red_eyes.icon_default = CC.atlas("res://art/ui/challenge_mode/challenge_icons/Red_Eyes.png", Rect2(0, 0, 32, 32))
	red_eyes.icon_selected = CC.atlas("res://art/ui/challenge_mode/challenge_icons/Red_Eyes.png", Rect2(32, 0, 32, 32))
	red_eyes.toggled_callback = func(state: bool):
		Global.challenge_mode_settings.set(
			"challenge_red_eyes",
			state
		)
	CC._add_builtin_challenge(red_eyes)
	
	var no_items = CC.CustomChallenge.new()
	no_items.name = "no_items"
	no_items.description = "No items."
	no_items.icon_default = CC.atlas("res://art/ui/challenge_mode/challenge_icons/No_Items.png", Rect2(0, 0, 32, 32))
	no_items.icon_selected = CC.atlas("res://art/ui/challenge_mode/challenge_icons/No_Items.png", Rect2(32, 0, 32, 32))
	no_items.toggled_callback = func(state: bool):
		Global.challenge_mode_settings.set(
			"challenge_no_items",
			state
		)
	CC._add_builtin_challenge(no_items)
	
	var no_doors = CC.CustomChallenge.new()
	no_doors.name = "no_doors"
	no_doors.description = "Start with no doors."
	no_doors.icon_default = CC.atlas("res://art/ui/challenge_mode/challenge_icons/No_Doors.png", Rect2(0, 0, 32, 32))
	no_doors.icon_selected = CC.atlas("res://art/ui/challenge_mode/challenge_icons/No_Doors.png", Rect2(32, 0, 32, 32))
	no_doors.toggled_callback = func(state: bool):
		Global.challenge_mode_settings.set(
			"challenge_no_doors",
			state
		)
	CC._add_builtin_challenge(no_doors)
	
	var die_irl = CC.CustomChallenge.new()
	die_irl.name = "die_irl"
	die_irl.description = "Die in game, die in real life."
	die_irl.icon_default = CC.atlas("res://art/ui/challenge_mode/challenge_icons/Death_Challenge.png", Rect2(0, 0, 32, 32))
	die_irl.icon_selected = CC.atlas("res://art/ui/challenge_mode/challenge_icons/Death_Challenge.png", Rect2(32, 0, 32, 32))
	die_irl.toggled_callback = func(state: bool):
		Global.challenge_mode_settings.set(
			"challenge_die_irl",
			state
		)
	CC._add_builtin_challenge(die_irl)
	
	var key_enabled = CC.CustomChallenge.new()
	key_enabled.name = "key"
	key_enabled.description = "Must pick up key in gamekyd."
	key_enabled.icon_default = CC.atlas("res://art/ui/challenge_mode/challenge_icons/Key.png", Rect2(0, 0, 32, 32))
	key_enabled.icon_selected = CC.atlas("res://art/ui/challenge_mode/challenge_icons/Key.png", Rect2(32, 0, 32, 32))
	key_enabled.toggled_callback = func(state: bool):
		Global.challenge_mode_settings.set(
			"challenge_key_enabled",
			state
		)
	CC._add_builtin_challenge(key_enabled)
	
	var living_animals = CC.CustomChallenge.new()
	living_animals.name = "living_animals"
	living_animals.description = "Animals move in patterns while collecting gas."
	living_animals.icon_default = CC.atlas("res://art/ui/challenge_mode/challenge_icons/Wildlife.png", Rect2(0, 0, 32, 32))
	living_animals.icon_selected = CC.atlas("res://art/ui/challenge_mode/challenge_icons/Wildlife.png", Rect2(32, 0, 32, 32))
	living_animals.toggled_callback = func(state: bool):
		Global.challenge_mode_settings.set(
			"challenge_living_animals",
			state
		)
	CC._add_builtin_challenge(living_animals)
	
	var corruption = CC.CustomChallenge.new()
	corruption.name = "corruption"
	corruption.description = "Click the corruption to destroy it."
	corruption.icon_default = CC.atlas("res://art/ui/challenge_mode/challenge_icons/Corruption.png", Rect2(0, 0, 32, 32))
	corruption.icon_selected = CC.atlas("res://art/ui/challenge_mode/challenge_icons/Corruption.png", Rect2(32, 0, 32, 32))
	corruption.toggled_callback = func(state: bool):
		Global.challenge_mode_settings.set(
			"challenge_monkeywrench",
			state
		)
	CC._add_builtin_challenge(corruption)
	#endregion
	
	#region Presets
	var welcome_back = CC.CustomPreset.new()
	welcome_back.name = "welcome_back"
	welcome_back.text = "WELCOME BACK"
	welcome_back.icon_default = CC.atlas("res://art/ui/challenge_mode/preset_icons/preset_icon_welcome_back.png", Rect2(0, 0, 16, 16))
	welcome_back.icon_selected = CC.atlas("res://art/ui/challenge_mode/preset_icons/preset_icon_welcome_back.png", Rect2(16, 0, 16, 16))
	welcome_back.enabled_challenges = [
		"steering",
		"monster_2d",
		"lose_gas",
		"red_eyes",
	]
	welcome_back.enabled_callback = func():
		Global.challenge_mode_settings.monster_aggression_3d = 6
		Global.challenge_mode_settings.monster_aggression_2d = 4
		Global.challenge_mode_settings.gamekyd_drive_speed = 5
		Global.challenge_mode_settings.gamekyd_item_selected = 4
		Global.challenge_mode_settings.gamekyd_chicken_selected = 9
		Global.challenge_mode_settings.gamekyd_hunger_selected = 7
	CC._add_builtin_preset(welcome_back)
	
	var corrupted_data = CC.CustomPreset.new()
	corrupted_data.name = "corrupted_data"
	corrupted_data.text = "CORRUPTED DATA"
	corrupted_data.icon_default = CC.atlas("res://art/ui/challenge_mode/preset_icons/preset_icon_corrupted_data.png", Rect2(0, 0, 16, 16))
	corrupted_data.icon_selected = CC.atlas("res://art/ui/challenge_mode/preset_icons/preset_icon_corrupted_data.png", Rect2(16, 0, 16, 16))
	corrupted_data.enabled_challenges = [
		"steering",
		"monster_2d",
		"lose_gas",
		"die_irl",
		"corruption",
	]
	corrupted_data.enabled_callback = func():
		Global.challenge_mode_settings.monster_aggression_3d = 6
		Global.challenge_mode_settings.monster_aggression_2d = 8
		Global.challenge_mode_settings.gamekyd_drive_speed = 6
		Global.challenge_mode_settings.gamekyd_item_selected = 3
		Global.challenge_mode_settings.gamekyd_chicken_selected = 5
		Global.challenge_mode_settings.gamekyd_hunger_selected = 6
	CC._add_builtin_preset(corrupted_data)
	
	var gamer = CC.CustomPreset.new()
	gamer.name = "gamer"
	gamer.text = "GAMER"
	gamer.icon_default = CC.atlas("res://art/ui/challenge_mode/preset_icons/preset_icon_gamer.png", Rect2(0, 0, 16, 16))
	gamer.icon_selected = CC.atlas("res://art/ui/challenge_mode/preset_icons/preset_icon_gamer.png", Rect2(16, 0, 16, 16))
	gamer.enabled_challenges = [
		"steering",
		"monster_2d",
		"lose_gas",
		"die_irl",
		"key",
		"living_animals",
	]
	gamer.enabled_callback = func():
		Global.challenge_mode_settings.monster_aggression_3d = 7
		Global.challenge_mode_settings.monster_aggression_2d = 10
		Global.challenge_mode_settings.gamekyd_drive_speed = 8
		Global.challenge_mode_settings.gamekyd_item_selected = 2
		Global.challenge_mode_settings.gamekyd_chicken_selected = 1
		Global.challenge_mode_settings.gamekyd_hunger_selected = 5
	CC._add_builtin_preset(gamer)
	
	var harder_mode = CC.CustomPreset.new()
	harder_mode.name = "harder_mode"
	harder_mode.text = "HARDER MODE"
	harder_mode.icon_default = CC.atlas("res://art/ui/challenge_mode/preset_icons/preset_icon_harder_mode.png", Rect2(0, 0, 16, 16))
	harder_mode.icon_selected = CC.atlas("res://art/ui/challenge_mode/preset_icons/preset_icon_harder_mode.png", Rect2(16, 0, 16, 16))
	harder_mode.enabled_challenges = [
		"steering",
		"monster_2d",
		"lose_gas",
		"red_eyes",
		"no_items",
		"die_irl",
		"key",
		"living_animals",
	]
	harder_mode.enabled_callback = func():
		Global.challenge_mode_settings.monster_aggression_3d = 8
		Global.challenge_mode_settings.monster_aggression_2d = 8
		Global.challenge_mode_settings.gamekyd_drive_speed = 7
		Global.challenge_mode_settings.gamekyd_item_selected = 2
		Global.challenge_mode_settings.gamekyd_chicken_selected = 9
		Global.challenge_mode_settings.gamekyd_hunger_selected = 5
	CC._add_builtin_preset(harder_mode)
	
	var fast_lane = CC.CustomPreset.new()
	fast_lane.name = "fast_lane"
	fast_lane.text = "FAST LANE"
	fast_lane.icon_default = CC.atlas("res://art/ui/challenge_mode/preset_icons/preset_icon_fast_lane.png", Rect2(0, 0, 16, 16))
	fast_lane.icon_selected = CC.atlas("res://art/ui/challenge_mode/preset_icons/preset_icon_fast_lane.png", Rect2(16, 0, 16, 16))
	fast_lane.enabled_challenges = [
		"steering",
		"lose_gas",
		"red_eyes",
		"no_doors",
		"die_irl",
		"key",
		"living_animals",
	]
	fast_lane.enabled_callback = func():
		Global.challenge_mode_settings.monster_aggression_3d = 10
		Global.challenge_mode_settings.monster_aggression_2d = 1
		Global.challenge_mode_settings.gamekyd_drive_speed = 10
		Global.challenge_mode_settings.gamekyd_item_selected = 4
		Global.challenge_mode_settings.gamekyd_chicken_selected = 7
		Global.challenge_mode_settings.gamekyd_hunger_selected = 8
	CC._add_builtin_preset(fast_lane)
	
	var sixth_sense = CC.CustomPreset.new()
	sixth_sense.name = "sixth_sense"
	sixth_sense.text = "6TH SENSE"
	sixth_sense.icon_default = CC.atlas("res://art/ui/challenge_mode/preset_icons/preset_icon_sixth_sense.png", Rect2(0, 0, 16, 16))
	sixth_sense.icon_selected = CC.atlas("res://art/ui/challenge_mode/preset_icons/preset_icon_sixth_sense.png", Rect2(16, 0, 16, 16))
	sixth_sense.enabled_challenges = [
		"steering",
		"monster_2d",
		"red_eyes",
		"no_items",
		"no_doors",
		"die_irl",
		"living_animals",
		"corruption",
	]
	sixth_sense.enabled_callback = func():
		Global.challenge_mode_settings.monster_aggression_3d = 10
		Global.challenge_mode_settings.monster_aggression_2d = 9
		Global.challenge_mode_settings.gamekyd_drive_speed = 9
		Global.challenge_mode_settings.gamekyd_item_selected = 1
		Global.challenge_mode_settings.gamekyd_chicken_selected = 3
		Global.challenge_mode_settings.gamekyd_hunger_selected = 9
	CC._add_builtin_preset(sixth_sense)
	
	var taste_of_hell = CC.CustomPreset.new()
	taste_of_hell.name = "taste_of_hell"
	taste_of_hell.text = "TASTE OF HELL"
	taste_of_hell.icon_default = CC.atlas("res://art/ui/challenge_mode/preset_icons/preset_icon_taste_of_hell.png", Rect2(0, 0, 16, 16))
	taste_of_hell.icon_selected = CC.atlas("res://art/ui/challenge_mode/preset_icons/preset_icon_taste_of_hell.png", Rect2(16, 0, 16, 16))
	taste_of_hell.enabled_challenges = [
		"steering",
		"monster_2d",
		"lose_gas",
		"red_eyes",
		"no_items",
		"no_doors",
		"die_irl",
		"key",
		"living_animals",
		"corruption",
	]
	taste_of_hell.enabled_callback = func():
		Global.challenge_mode_settings.monster_aggression_3d = 9
		Global.challenge_mode_settings.monster_aggression_2d = 10
		Global.challenge_mode_settings.gamekyd_drive_speed = 8
		Global.challenge_mode_settings.gamekyd_item_selected = 1
		Global.challenge_mode_settings.gamekyd_chicken_selected = 0
		Global.challenge_mode_settings.gamekyd_hunger_selected = 7
	CC._add_builtin_preset(taste_of_hell)
	
	var suffer = CC.CustomPreset.new()
	suffer.name = "suffer"
	suffer.text = "SUFFER"
	suffer.icon_default = CC.atlas("res://art/ui/challenge_mode/preset_icons/preset_icon_suffer.png", Rect2(0, 0, 16, 16))
	suffer.icon_selected = CC.atlas("res://art/ui/challenge_mode/preset_icons/preset_icon_suffer.png", Rect2(16, 0, 16, 16))
	suffer.enabled_challenges = [
		"steering",
		"monster_2d",
		"lose_gas",
		"red_eyes",
		"no_items",
		"no_doors",
		"die_irl",
		"key",
		"living_animals",
		"corruption",
	]
	suffer.enabled_callback = func():
		Global.challenge_mode_settings.monster_aggression_3d = 10
		Global.challenge_mode_settings.monster_aggression_2d = 10
		Global.challenge_mode_settings.gamekyd_drive_speed = 10
		Global.challenge_mode_settings.gamekyd_item_selected = 1
		Global.challenge_mode_settings.gamekyd_chicken_selected = 0
		Global.challenge_mode_settings.gamekyd_hunger_selected = 5
	CC._add_builtin_preset(suffer)
	#endregion
