extends ColorRect

#onready var animator: AnimationPlayer = $AnimationPlayer
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var play_button: Button = find_node("RESUME")
onready var quit_button: Button = find_node("QUIT")


	
#func pause():
#	animator.play("Pause")
#	get_tree().paused = true
#func pause():
#	animator.play("PAUSE")
#	get_tree().paused = true
#func unpause():
#	animator.play("Unpause")
#	get_tree().paused = false


#func _on_RESUME_pressed():
#	animator.play("UNPAUSE")
#	get_tree().paused = false
#	if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
#		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#		get_tree().set_input_as_handled()


func _on_QUIT_pressed():
	get_tree().change_scene("res://Dialogue/startDialogue.tscn")
#THIS IS FOR STARTING THE GAME, NOT QUITTING

func _on_START_pressed():
	get_tree().quit()
#THIS IS FOR QUITING THE GAME, NOT STARTING
