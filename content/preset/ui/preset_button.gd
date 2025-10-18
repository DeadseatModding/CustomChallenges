extends Container

const ZACKERYRSMITH_CC_LOG_NAME := "ZackeryRSmith-CustomChallenges:PresetButton"

@onready var CC = ModLoader.get_node("ZackeryRSmith-CustomChallenges")
@onready var button = $Button
@onready var label = $Label

## NOTE: At this point the Object should ALWAYS derive from CustomPreset so
##       we simply don't do any error handling here.
var preset: Object = null:
	set(x):
		if not is_node_ready():
			await ready
		preset = x
		
		var default = StyleBoxTexture.new()
		default.texture = preset.get_icon_default()
		button.add_theme_stylebox_override("normal", default)
		button.add_theme_stylebox_override("pressed", default)
		
		var selected = StyleBoxTexture.new()
		selected.texture = preset.get_icon_selected()
		button.add_theme_stylebox_override("hover", selected)
		
		label.set_text(preset.text)
		_update_button()

func _update_button(enabled: bool = false) -> void:
	if preset == null:
		return

func _on_pressed() -> void:
	if preset == null:
		return
	
	SignalServer.play_challenge_click.emit()
	CC.disable_all_challenges()
	for name in preset.enabled_challenges:
		var challenge = CC.challenges.get(name)
		if challenge:
			challenge.enabled = true
		else:
			ModLoaderLog.warning("Cannot enabled challenge `%s` as it doesn't exist!" % name, ZACKERYRSMITH_CC_LOG_NAME)
	preset.enabled_callback.call()
	
	SignalServer.update_challenge_buttons.emit()
	SignalServer.update_challenge_adjustments.emit()
	_update_button(true)

func _on_mouse_entered() -> void:
	if preset == null:
		return
	
	SignalServer.play_challenge_hover.emit()

func _on_mouse_exited() -> void:
	SignalServer.update_challenge_description.emit("")
