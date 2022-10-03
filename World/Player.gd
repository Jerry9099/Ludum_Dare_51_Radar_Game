extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		$PAUSE_MENU.pause()
