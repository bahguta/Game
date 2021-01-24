extends Area2D

#var speed = 0
export (int) var Speed
export (PackedScene) var Bullet
var Move = Vector2()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var limit

# Called when the node enters the scene tree for the first time.
func _ready():
	limit  = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Move = Vector2()
	
	if	Input.is_action_pressed("ui_accept"):
		#var laser = get_parent().get_node("laser")
		_shoot()
		#laser._process(delta)
	if	Input.is_action_pressed("ui_right"):
		Move.x += 1
	if	Input.is_action_pressed("ui_left"):
		Move.x -= 1
	if	Input.is_action_pressed("ui_up"):
		Move.y -= 1
	if	Input.is_action_pressed("ui_down"):
		Move.y += 1
		
	if Move.length() > 0: 
		Move = Move.normalized() * Speed
		
	position += Move * delta
	position.x = clamp(position.x, 0, limit.x)
	position.y = clamp(position.y, 0, limit.y)
	#pass


func _shoot() :
	var bullet = Bullet.instance()
	#add_child(bullet)
	#bullet.transform = $Muzzle.transform


