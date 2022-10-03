extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$RadarMain/Player.connect("hit", self, "_on_Player_hit")
	$RadarMain/Player.connect("died", self, "_on_Player_dead")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var new_pos = $RadarMain/Player.get_translation()
	new_pos.y = $Monitors_Viewport_Axis/RadarScreenViewport/Viewport/Camera.get_translation().y
	$Monitors_Viewport_Axis/RadarScreenViewport/Viewport/Camera.set_translation(new_pos)
	#Enable the memes
	#$Player/CameraHolder/Camera/Screenshake.start() 

func _on_Player_hit():
	$Player/CameraHolder/Camera/Screenshake.start()
	$Audio/MissileHitSound.play()

func _on_Player_dead():

	get_tree().change_scene("res://Dialogue/endDialogue.tscn")
	#play dead sounds, etc

