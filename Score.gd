extends RichTextLabel

var score 


func _ready():
	score = 0
	text = "SCORE:   " + String(score)
	

func _setScore():
	score += 1
	text = "SCORE:   " + String(score)


