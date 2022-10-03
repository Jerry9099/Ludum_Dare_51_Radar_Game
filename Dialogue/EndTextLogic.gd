extends Label

var messages = [
	"You have succeeded.",
	"Despite humanities' best efforts,\nyou have bid for enough time\n\n\nto COMPROMISE another craft.",
	"The old crew sent out a distress signal before perishing,\n\n\n\ntheir struggle will mean NOTHING.",
	"Like everything else in this pitful galaxy,",
	"we will CONSUME it all.",
	"",
	"However,\nthe damage to the ship's lift thrusters and outdated radar system will affect our\n...\n...\nEFFICACY.",
	"The Vastitas Fracturae will spread until there is\nNO MORE\nin the galaxy.",
	"",
	" ",
	" ",
	" ",
	"Thank you for playing our game",
	"This game was made as a part of Ludum Dare 51",
	"Programming:\nJerry Ding\nJohnny Dai\nDavid Tuvshin\nTony Yeu\nLucas Kelly\nColby Ye\nLeah\nJustin Wang",
	"Art:\nPreksha Ambrish\nJohnny Dai",
	"Sound Design/Music:\nFelipe Jun Iglesia\nJohnny Dai",
	"Narrative Design:\nColby Ye\nJustin Wang"
	]

var typing_speed = .08
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
