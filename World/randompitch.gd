extends AudioStreamPlayer3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func play(from_position = 0.0):
	randomize()
	pitch_scale = rand_range(0.5, 1.5)
	print (pitch_scale)
	.play(from_position)

 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
