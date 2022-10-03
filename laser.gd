extends RayCast


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal clicked

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(isClicked)
	if is_colliding():
		#print(get_collider())
		if Input.is_action_just_pressed("click"):
			#print(get_collider().name)
			emit_signal("clicked")
			if get_collider().has_method("press"):
				print("Will press")
				#buttonScript.press()
			#get_collider().michael()


