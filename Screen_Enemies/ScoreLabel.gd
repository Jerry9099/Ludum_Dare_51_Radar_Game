extends Label


var score = 0
var health = 5

func _ready():
	text = "Score: %s" % score + "\nHP: %s" % health

func _on_ScoreTimer_timeout():
	if health != 0:
		score += 10
	text = "Score: %s" % score + "\nHP: %s" % health

func _on_Player_hit():
	if health != 0:
		health -= 1
	text = "Score: %s" % score + "\nHP: %s" % health
