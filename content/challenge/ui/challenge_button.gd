extends CenterContainer

@onready var CC = ModLoader.get_node("ZackeryRSmith-CustomChallenges")

@onready var button = $Button
@onready var image = $TextureRect

## NOTE: At this point the Object should ALWAYS derive from CustomChallenge so
##       we simply don't do any error handling here.
var challenge: Object = null:
	set(x):
		if not is_node_ready():
			await ready
		challenge = x
		_update_button()

func _update_button() -> void:
	if challenge == null:
		return
	
	image.texture = challenge.get_icon_selected() if challenge.enabled else challenge.get_icon_default()

func _on_pressed() -> void:
	if challenge == null:
		return
	
	SignalServer.play_challenge_click.emit()
	challenge.enabled = !challenge.enabled
	_update_button()

func _on_mouse_entered() -> void:
	if challenge == null:
		return
	
	SignalServer.play_challenge_hover.emit()
	SignalServer.update_challenge_description.emit(challenge.description)

func _on_mouse_exited() -> void:
	SignalServer.update_challenge_description.emit("")
