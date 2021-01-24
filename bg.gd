extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var move
var speed = 300
var arr
var limit

# Called when the node enters the scene tree for the first time.
func _ready():
	move = Vector2()
	limit  = get_viewport_rect().size
	position.y = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	move = Vector2()
	if	int(position.y) == limit.y : 
		position.y = 0
		move.y = 0
	else :
		position.y += 4
		move.y += 2
	
