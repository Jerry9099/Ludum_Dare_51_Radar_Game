extends Node

const TRANS = Tween.TRANS_SINE
const EASE = Tween.EASE_OUT

export var amplitude = 0
export var priority = 0

onready var camera = get_parent()
var base_location = Vector3()

func _ready():
	base_location = camera.get_translation()

func start(duration = 0.6, frequency = 20, amplitude = .1, priority = 0):
	
	if (priority >= self.priority):
		self.priority = priority
		self.amplitude = amplitude

		$Duration.wait_time = duration
		$Frequency.wait_time = 1 / float(frequency)
		$Duration.start()
		$Frequency.start()

		_new_shake()

func _new_shake():
	var rand = base_location
	
	rand.x = rand_range(-amplitude, amplitude)
	while abs(rand.x) < amplitude/3: 
		rand.x = rand_range(-amplitude, amplitude)
	
	rand.y = rand_range(-amplitude, amplitude)
	while abs(rand.y) < amplitude/3: 
		rand.y = rand_range(-amplitude, amplitude)

	#rand.z = rand_range(-amplitude, amplitude)
	#while abs(rand.z) < amplitude/3: 
		#rand.z = rand_range(-amplitude, amplitude)
		
	rand.x += base_location.x
	rand.y += base_location.y
	
	$ShakeTween.interpolate_property(camera, "translation", camera.translation, rand, $Frequency.wait_time, TRANS, EASE)
	$ShakeTween.start()
	#print(base_location)
	#print(rand)

func _reset():
	$ShakeTween.interpolate_property(camera, "translation", camera.translation, base_location, $Frequency.wait_time, TRANS, EASE)
	#$ShakeTween.interpolate_property(camera, "translation", camera.translation, Vector3(), $Frequency.wait_time, TRANS, EASE)
	$ShakeTween.start()

	priority = 0


func _on_Frequency_timeout():
	_new_shake()



func _on_Duration_timeout():
	_reset()
	$Frequency.stop()
