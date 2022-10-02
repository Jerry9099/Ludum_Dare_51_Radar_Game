extends KinematicBody

var angular_speed = PI/5

func _physics_process(delta):
	rotate_y(-angular_speed * delta)
	
