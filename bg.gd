extends Node2D


var move
var speed = 300
var arr
var limit


func _ready():
	move = Vector2()
	limit  = get_viewport_rect().size
	position.y = 0


func _process(delta):
	move = Vector2()
	if	int(position.y) == limit.y : 
		position.y = 0
		move.y = 0
	else :
		position.y += 4
		move.y += 2

