extends Node

const DEFAULT_ICON_PATH = "res://art/ui/challenge_mode/challenge_icons/Question_Mark.png"

#region Exported props.
@export var enabled: bool = false:
	set(truthy):
		enabled = truthy
		toggled_callback.call(truthy)
@export var description: String = ""
## 32x32 is recommended
@export var icon_default: Texture = null
## 32x32 is recommended
@export var icon_selected: Texture = null
## run custom code when toggled (typically should be avoided)
@export var toggled_callback: Callable = func(_truthy: bool): pass
#endregion

## Ensures a texture even if [code]icon_default[/code] is null
func get_icon_default() -> Texture:
	var CC = ModLoader.get_node("ZackeryRSmith-CustomChallenges")
	return icon_default if icon_default else CC.atlas(DEFAULT_ICON_PATH, Rect2(0, 0, 32, 32))

## Ensures a texture even if [code]icon_default[/code] is null
func get_icon_selected() -> Texture:
	var CC = ModLoader.get_node("ZackeryRSmith-CustomChallenges")
	return icon_selected if icon_selected else CC.atlas(DEFAULT_ICON_PATH, Rect2(32, 0, 32, 32))
