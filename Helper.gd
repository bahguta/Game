extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var bullet =  load("res://Bullet.tscn")
onready var root = get_tree().get_root().get_node("Game")
onready var player = root.get_node("Player")

var move 
var limit
var Speed



# Called when the node enters the scene tree for the first time.
func _ready():
	move = Vector2()
	limit  = get_viewport_rect().size
	Speed = 200
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#_input_control(delta)
	if	Input.is_action_just_released("ui_accept"):
		_shoot()
	#position.x = clamp(position.x, 0, limit.x)
	#position.y = clamp(position.y, 0, limit.y-100)
	#position.x = _get_side(side)
	#position.y = player.position.y



func _shoot():
	var bulletInstance = bullet.instance()
	bulletInstance.position = Vector2(position.x, position.y -20)
	get_tree().get_root().add_child(bulletInstance)


func _input_control(delta):
	if	Input.is_action_just_released("ui_page_down"):
		if get_tree().paused: 
			get_tree().paused = false
		else:
			get_tree().paused = true
	if	Input.is_action_just_released("ui_accept"):
		_shoot()
	if	Input.is_action_pressed("ui_right"):
		position += transform.x * Speed * delta
	if	Input.is_action_pressed("ui_left"):
		position -= transform.x * Speed * delta
	if	Input.is_action_pressed("ui_up"):
		position -= transform.y * Speed * delta
	if	Input.is_action_pressed("ui_down"):
		position += transform.y * Speed * delta

# left side is primary. if side is false the helper will show right of the player 
#func _set_side(side) -> float:
#	if	 !full:
#		if !side:
#			side = true
#			return position.x - 80
#			
#		else :
#			full = true
#			return position.x + 80
#			
#	else:
#		return position.x
