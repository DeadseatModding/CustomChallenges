extends Node

const DEFAULT_ICON_PATH = "res://art/ui/challenge_mode/preset_icons/preset_icon_default.png"

#region Exported props.
## Text displayed under preset
@export var text: String
## 16x16 is recommended
@export var icon_default: Texture
## 16x16 is recommended
@export var icon_selected: Texture
## An array of challenge names
@export var enabled_challenges: Array
## Additional logic to apply when the preset is enabled
## NOTE: this is a somewhat hacky solution to setting "adjustments"
@export var enabled_callback: Callable
#endregion

## Ensures a texture even if [code]icon_default[/code] is null
func get_icon_default() -> Texture:
	var CC = ModLoader.get_node("ZackeryRSmith-CustomChallenges")
	return icon_default if icon_default else CC.atlas(DEFAULT_ICON_PATH, Rect2(0, 0, 16, 16))

## Ensures a texture even if [code]icon_default[/code] is null
func get_icon_selected() -> Texture:
	var CC = ModLoader.get_node("ZackeryRSmith-CustomChallenges")
	return icon_selected if icon_selected else CC.atlas(DEFAULT_ICON_PATH, Rect2(16, 0, 16, 16))
