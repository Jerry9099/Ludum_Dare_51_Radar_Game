extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"





func _on_RESUME_mouse_entered():
	if get_tree().paused:
		play()
	
func _on_pQUIT_mouse_entered():
	if get_tree().paused:
		play()
	

func _on_START_mouse_entered():
	play()  # Replace with function body.

func _on_QUIT_mouse_entered():
	play()  # Replace with function body.

