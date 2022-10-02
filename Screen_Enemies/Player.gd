extends KinematicBody
signal hit

# How fast the player moves in meters per second.
export var MAX_SPEED = 6
export var ACCELERATION = 5
export var DECELERATION = 5

var velocity = Vector3()
var HP

func _ready():
	self.transform.origin.y = 0
	self.HP = 3
	

func _physics_process(delta):
	set_axis_lock(PhysicsServer.BODY_AXIS_LINEAR_Y, true)
	
	# Local variable to store the input direction.
	var direction = Vector3()
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.z = Input.get_action_strength("move_back") - Input.get_action_strength("move_forward")
	if direction.length_squared() > 1:
		direction = direction.normalized()
		
	var hvel = velocity
	hvel.y = 0

	var target = direction * MAX_SPEED
	var acceleration
	if direction.dot(hvel) > 0:
		acceleration = ACCELERATION
	else:
		acceleration = DECELERATION

	hvel = hvel.linear_interpolate(target, acceleration * delta)

	# Assign hvel's values back to velocity, and then move.
	velocity.x = hvel.x
	velocity.z = hvel.z
	$Pivot.look_at(translation + velocity.normalized(), Vector3.UP)
	velocity = move_and_slide(velocity, Vector3.UP)

func die():
	emit_signal("hit")
	hide()
	
func _on_MissileDetector_body_entered(_body):
	HP -= 1
	_body.explode()
	if HP==0:
		die()
