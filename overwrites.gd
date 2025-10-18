extends Node


var vanilla_file_paths: Array[String] = [
	"res://art/ui/arrow_challenge_spritesheet.png",
	"res://art/ui/challenge_mode/preset_icons/preset_icon_default.png"
]
var overwrite_file_paths: Array[String] = [
	"res://mods-unpacked/ZackeryRSmith-CustomChallenges/overwrites/art/ui/arrow_challenge_spritesheet.png",
	"res://mods-unpacked/ZackeryRSmith-CustomChallenges/overwrites/art/ui/challenge_mode/preset_icons/preset_icon_default.png"
]

var overwrite_resources := []


func _init():
	for i in overwrite_file_paths.size():
		var vanilla_path := vanilla_file_paths[i]
		var overwrite_path := overwrite_file_paths[i]

		var overwrite_resource := load(overwrite_path)
		overwrite_resources.push_back(overwrite_resource)
		overwrite_resource.take_over_path(vanilla_path)
