extends KinematicBody

signal squashed

# Minimum speed of the mob in meters per second.
export var min_speed = 1
# Maximum speed of the mob in meters per second.
export var max_speed = 2
# Steer force to push the missile to track the spaceship.
export var steer_force = 1.2
# Maximum track speed
export var track_speed = 10

var velocity = Vector3.ZERO
var acceleration = Vector3.ZERO

var target = null

func _ready():
	$AnimationPlayer.play("hide")

func _physics_process(_delta):
	set_axis_lock(PhysicsServer.BODY_AXIS_LINEAR_Y, true)
	acceleration = seek()
	velocity += acceleration * _delta
	velocity = velocity.normalized() * min(velocity.length(), max_speed)
	look_at_from_position(self.transform.origin, self.transform.origin + velocity, Vector3.UP)
	move_and_slide(velocity)

# We will call this function from the Main scene.
func initialize(start_position, player_position, _target):
	self.transform.origin.y = 0
	target = _target
	# We position the mob and turn it so that it looks at the player.
	look_at_from_position(start_position, player_position, Vector3.UP)
	# And rotate it randomly so it doesn't move exactly toward the player.
	rotate_y(rand_range(-PI / 4, PI / 4))
	# We calculate a random speed.
	var random_speed = rand_range(min_speed, max_speed)
	# We calculate a forward velocity that represents the speed.
	velocity = Vector3.FORWARD * random_speed
	# We then rotate the vector based on the mob's Y rotation to move in the direction it's looking.
	velocity = velocity.rotated(Vector3.UP, rotation.y)

func seek():
	var steer = Vector3.ZERO
	if target:
		var desired = (target.transform.origin - transform.origin).normalized() * track_speed
		steer = (desired - velocity).normalized() * steer_force
	return steer

func _on_VisibilityNotifier_screen_exited():
	explode()
	
func _on_LifeTime_timeout():
	explode()


func explode():
	#$Particles2D.emitting = false
	set_physics_process(false)
	queue_free()


func _on_PlayerDetector_body_entered(body):
	$AnimationPlayer.play("fade_in")
	

func _on_PlayerDetector_body_exited(body):
	$AnimationPlayer.play("fade_out")
