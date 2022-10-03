extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var new_pos = $RadarMain/Player.get_translation()
	new_pos.y = $Monitors_Viewport_Axis/RadarScreenViewport/Viewport/Camera.get_translation().y
	$Monitors_Viewport_Axis/RadarScreenViewport/Viewport/Camera.set_translation(new_pos)
	
