extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
var life 



# Called when the node enters the scene tree for the first time.
func _ready():
	life = get_parent().get_node("Player")._getLife()
	#push_align(RichTextLabel.ALIGN_CENTER)
	print(life)
	ALIGN_CENTER
	text = "LIFE:  " + str(life)




func _setLife():
	life -= 1
	text = "LIFE:  " + str(life)


