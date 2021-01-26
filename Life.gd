extends RichTextLabel

var life 

func _ready():
	life = get_parent().get_node("Player").life
	print(life)
	text = "LIFE:  " + str(life)

func _setLife(l):
	life = l
	text = "LIFE:  " + str(life)


