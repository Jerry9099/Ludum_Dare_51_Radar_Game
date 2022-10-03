extends Label3D

var time_elapsed = 0.0
var holder
var switch = true
onready var Audio: AudioStreamPlayer3D = $AudioStreamPlayer3D

func _process(delta: float) -> void:
	time_elapsed += delta
	var minutes = time_elapsed / 60
	var seconds = fmod(time_elapsed, 60)
	var milliseconds = fmod(time_elapsed, 1) * 100
	var time_string = "%02d:%02d:%02d" % [minutes, seconds, milliseconds]
	text = time_string
	if floor(fmod(seconds, 10)) == 0:
		if switch:
			Audio.play()
			switch = false
	if floor(fmod(seconds, 10)) == 1:
		switch = true
	
	
	
	

