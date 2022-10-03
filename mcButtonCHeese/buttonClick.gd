extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var anim = $buttonClick
onready var soundFX = $chuckle
# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("buttonClicked")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_laser_clicked():
	print("FUCKCUFFUCKFUCKJ")
	anim.play("buttonClicked")
	soundFX.stream.loop = false
	soundFX.play()

	pass # Replace with function body.
