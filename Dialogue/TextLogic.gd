extends Label

var messages = [
	"My First Message", 
	"Second Message For You"
]

var typing_speed = .1
var read_time = 2

var current_message = 0
var display = ""
var current_char = 0

func _ready():
	start_dialogue()
	
func start_dialogue():
	current_message = 0
	display = ""
	current_char = 0
	
	$Letter_Timer.set_wait_time(typing_speed)
	$Letter_Timer.start()

func stop_dialogue():
	# get_parent().remove_child(self)
	queue_free()

func _on_Letter_Timer_timeout():
	if (current_char < len(messages[current_message])):
		var next_char = messages[current_message][current_char]
		display += next_char
		
		self.text = display
		current_char += 1
	else:
		$Letter_Timer.stop()
		$message_Timer.one_shot = true
		$message_Timer.set_wait_time(read_time)
		$message_Timer.start()


func _on_message_Timer_timeout():
	if (current_message == len(messages) - 1):
		stop_dialogue()
	else: 
		current_message += 1
		display = ""
		current_char = 0
		$Letter_Timer.start()
