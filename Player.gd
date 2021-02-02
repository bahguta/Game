extends Area2D


var move 
var limit
var Speed 
var helpers = 0
var leftHelp
var rightHelp

onready var root = get_tree().get_root()
onready var bullet =  load("res://Bullet.tscn")
onready var leftHelperScene =  load("res://Helper.tscn")
onready var rightHelperScene =  load("res://Helper.tscn")

func _ready():
	move = Vector2()
	limit  = get_viewport_rect().size
	Speed = 200
	

func _process(delta):
	_input_control(delta)
	position.x = clamp(position.x, 0, limit.x)
	position.y = clamp(position.y, 0, limit.y-100)
	if	leftHelp:
		_set_pos_leftHelper()
	if	rightHelp:
		_set_pos_rightHelper()

func _shoot():
	#var scene = load("res://Bullet.tscn")
	#var bullet = scene.instance()
	#add_child(bullet)
	var bulletInstance = bullet.instance()
	bulletInstance.position = Vector2(position.x, position.y -20)
	root.add_child(bulletInstance)
	
func _getCurrentPosition():
	return position

func _input_control(delta):
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



func _remove_all_helpers():
	if	root.has_node("leftHelp"):
		root.remove_child(leftHelp)
	if	root.has_node("rightHelp"):
		root.remove_child(rightHelp)



func _add_helper():
	if	!leftHelp:
		leftHelp = leftHelperScene.instance()
		_set_pos_leftHelper()
		root.add_child(leftHelp)
		return
	elif	!rightHelp:
		rightHelp = rightHelperScene.instance()
		_set_pos_rightHelper()
		root.add_child(rightHelp)
	#helpers += 1
	#match helpers :
	#	1:
	#		leftHelp = leftHelperScene.instance()
	#		_set_pos_leftHelper()
	#		get_tree().get_root().add_child(leftHelp)

	#	2: 
	#		rightHelp = rightHelperScene.instance()
	#		_set_pos_rightHelper()
	#		get_tree().get_root().add_child(rightHelp)


func _remove_helper(h):
	remove_child(h)
	

func _set_pos_leftHelper():
	if leftHelp:
		leftHelp.position.x = position.x - 80  # da se poqvi ot lqvo na igracha
		leftHelp.position.y = position.y + 20  # da go svalim malko nadolu ot centura na igracha

func _set_pos_rightHelper():
	if	rightHelp:
		rightHelp.position.x = position.x + 80  # da se poqvi ot lqvo na igracha ## + e na lqvo i - nagore na dqsno
		rightHelp.position.y = position.y + 20  # da go svalim malko nadolu ot centura na igracha ## + e na dolu i - na gore
