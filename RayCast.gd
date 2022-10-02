extends RayCast


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	
	if is_colliding():
		#print(get_collider())
		if Input.is_action_just_pressed("fire"):
			print("FUCK")
			if(get_collider().name == "deathButton"):
				print("YOu have died. I am so sorry")
		
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
