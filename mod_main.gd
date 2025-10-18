extends Node

const ZACKERYRSMITH_CC_DIR := "ZackeryRSmith-CustomChallenges"
const ZACKERYRSMITH_CC_LOG_NAME := "ZackeryRSmith-CustomChallenges:Main"

var mod_dir_path := ModLoaderMod.get_unpacked_dir().path_join(
	ZACKERYRSMITH_CC_DIR
)

var CustomChallenge = load(mod_dir_path.path_join("api/custom_challenge.gd"))
var CustomPreset = load(mod_dir_path.path_join("api/custom_preset.gd"))

var challenges: Dictionary[String, Object]
func disable_all_challenges():
	for challenge in challenges.values():
		challenge.enabled = false

var presets: Dictionary[String, Object]

func _init() -> void:
	var extensions_dir_path = mod_dir_path.path_join("extensions")
	ModLoaderMod.install_script_extension(
		extensions_dir_path.path_join("ui/challenge_mode/challenge_ui_pg_1.gd")
	)
	ModLoaderMod.install_script_extension(
		extensions_dir_path.path_join("scenes/ui/challenge_mode_score.gd")
	)

func _ready() -> void:
	load(mod_dir_path.path_join("builtin.gd")).new()._ready()
	ModLoaderLog.info("Ready!", ZACKERYRSMITH_CC_LOG_NAME)

func add_challenge(challenge: Object) -> void:
	if challenge.get_script() != CustomChallenge:
		return ModLoaderLog.warning(
			"User attempted to add a Challenge which does not derive from CustomChallenge",
			ZACKERYRSMITH_CC_LOG_NAME
		)
	var log_string = "Adding challenge:"
	log_string += "\n\tname: %s" % challenge.name
	log_string += "\n\tdescription: %s" % challenge.description
	ModLoaderLog.info(log_string, ZACKERYRSMITH_CC_LOG_NAME)
	challenges.merge({challenge.name: challenge})

func add_preset(preset: Object) -> void:
	if preset.get_script() != CustomPreset:
		return ModLoaderLog.warning(
			"User attempted to add a Preset which does not derive from CustomPreset",
			ZACKERYRSMITH_CC_LOG_NAME
		)
	ModLoaderLog.info("Adding preset %s" % [preset.name], ZACKERYRSMITH_CC_LOG_NAME)
	presets.merge({preset.name: preset})

## Helper function to easily create an AtlasTexture
func atlas(texture_path: String, region: Rect2) -> AtlasTexture:
	var texture = AtlasTexture.new()
	texture.atlas = load(texture_path)
	texture.region = region
	return texture
