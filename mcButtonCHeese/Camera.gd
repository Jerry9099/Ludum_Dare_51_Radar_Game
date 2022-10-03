extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var head = $Camera

var sensitivity = -0.1
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	
	
	if event is InputEventMouseMotion && Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		head.rotation_degrees.y += sensitivity * event.relative.x
		head.rotation_degrees.x += sensitivity * event.relative.y
		head.rotation_degrees.x = clamp(head.rotation_degrees.x,-90,90)
		head.rotation_degrees.y = clamp(head.rotation_degrees.y,-90,90)
		
	#release mouse when esc key is pressed
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	#re-capture when click on screen, make sure check input mapping
	if event.is_action_pressed("click"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			get_tree().set_input_as_handled()

