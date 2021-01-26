extends RichTextLabel

var life 

func _ready():
	life = get_parent().get_node("Player")._getLife()
	print(life)
	text = "LIFE:  " + str(life)

func _setLife():
	life -= 1
	text = "LIFE:  " + str(life)


