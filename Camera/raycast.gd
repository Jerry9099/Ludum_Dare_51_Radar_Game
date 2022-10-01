extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

const RAY_LENGTH = 1000.0

func _physics_process(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		var camera = $Camera
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * RAY_LENGTH
		var space_state = get_world().direct_space_state
		var result = space_state.intersect_ray(from, to)
		print(result)
