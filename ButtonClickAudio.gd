extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_START_button_down():
	play() # Replace with function body.

func _on_QUIT_button_down():
	play() # Replace with function body.
	
func _on_pQUIT_button_down():
	if get_tree().paused:
		play()

func _on_Button_button_down():
	play() # Replace with function body.
	
func _on_RESUME_button_down():
	if get_tree().paused:
		play()


func _on_Skip_button_down():
	play() # Replace with function body.
