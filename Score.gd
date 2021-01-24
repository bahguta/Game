extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
var score 



# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	#push_align(RichTextLabel.ALIGN_CENTER)
	ALIGN_CENTER
	text = "SCORE:   " + String(score)



func _setScore():
	score += 1
	text = "SCORE:   " + String(score)


