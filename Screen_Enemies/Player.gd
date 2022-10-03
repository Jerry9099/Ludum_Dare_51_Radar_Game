extends KinematicBody
signal hit
signal died

# How fast the player moves in meters per second.
export var MAX_SPEED = 2
export var ACCELERATION = 1
export var DECELERATION = 1

export var limit_size_square = 30

export var HP = 5

var top_limit = -limit_size_square
var bottom_limit = limit_size_square
var right_limit = limit_size_square
var left_limit = -limit_size_square

var velocity = Vector3.ZERO

func _ready():
	self.transform.origin.y = 0
	#self.HP = 3
	
	#TEMP
	self.connect("died", self, "_on_Player_dead")
	

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
	if translation.x > right_limit && velocity.x > 0:
		velocity.x = 0
	if translation.x < left_limit && velocity.x < 0:
		velocity.x = 0
	if translation.z < top_limit && velocity.z < 0:
		velocity.z = 0
	if translation.z > bottom_limit && velocity.z > 0:
		velocity.z = 0
	
	#print(translation)
	
	velocity = move_and_slide(velocity, Vector3.UP)

func die():
	emit_signal("died")
	hide()
	
func _on_MissileDetector_body_entered(_body):
	HP -= 1
	emit_signal("hit")
	if HP==0:
		die()
		
func _on_Player_dead():
	print("aaa")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene("res://Dialogue/endDialogue.tscn")
