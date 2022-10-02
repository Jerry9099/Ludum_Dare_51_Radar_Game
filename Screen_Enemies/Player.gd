extends KinematicBody
signal hit

# How fast the player moves in meters per second.
export var speed = 4
export var fall_acceleration = 75

export var limit_size_square = 30

var top_limit = limit_size_square
var bottom_limit = -limit_size_square
var right_limit = limit_size_square
var left_limit = -limit_size_square

var velocity = Vector3.ZERO
var HP

func _ready():
	self.transform.origin.y = 0
	self.HP = 3
	

func _physics_process(delta):
	# Local variable to store the input direction.
	var direction = Vector3.ZERO
	print(global_translation.x)
	print(global_translation.z)
	# Check for each move input and update the direction
	if Input.is_action_pressed("move_right") && global_translation.x < right_limit:
		direction.x += 1
	if Input.is_action_pressed("move_left") && global_translation.x > left_limit:
		direction.x -= 1
	if Input.is_action_pressed("move_back") && global_translation.z < top_limit:
# Notice how we are working with the vector's x and z axes.
		# In 3D, the XZ plane is the ground plane.
		direction.z += 1
	if Input.is_action_pressed("move_forward") && global_translation.z > bottom_limit:
		direction.z -= 1
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(translation + direction, Vector3.UP)
		
	# Ground velocity
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	# Vertical velocity
	velocity.y -= fall_acceleration * delta
	
	# Moving the character
	velocity = move_and_slide(velocity, Vector3.UP)
	for index in range(get_slide_count()):
		# We check every collision that occurred this frame.
		var collision = get_slide_collision(index)
		# If we collide with a monster...

func die():
	emit_signal("hit")
	hide()
	
func _on_MissileDetector_body_entered(_body):
	HP -= 1
	_body.explode()
	if HP==0:
		die()
