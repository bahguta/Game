extends RichTextLabel

var score 


func _ready():
	score = 0
	text = "SCORE:   " + str(score)
	

func _setScore():
	score += 1
	text = "SCORE:   " + str(score)

func _gameover():
	score = 0
	text = "SCORE:   " + str(score)

func _set_boss_score():
	score += 100
	text = "SCORE:   " + str(score)
