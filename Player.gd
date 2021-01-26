extends Area2D


var move 
var limit
var Speed 
var life
var currentBullet



func _ready():
	move = Vector2()
	limit  = get_viewport_rect().size
	Speed = 200
	life = 3
	_shoot()
	

func _process(delta):
	move = Vector2()

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

	position.x = clamp(position.x, 0, limit.x)
	position.y = clamp(position.y, 0, limit.y-100)
	

func _shoot():
	var scene = load("res://Bullet.tscn")
	var bullet = scene.instance()
	add_child(bullet)
	currentBullet = bullet
	
func _getCurrentPosition():
	return position

func _setLife():
	life -= 1
