extends Area2D

var speed
var move
var rng
onready var bullet =  load("res://BulletEnemy.tscn")

# var t = izchislqvane na putqt na protivnicite. Doc: 
# https://docs.godotengine.org/fi/stable/tutorials/math/beziers_and_curves.html
var t = 0.0  

var limit
var count


var back = false

 
# Called when the node enters the scene tree for the first time.
func _ready():
	move = Vector2()
	speed = 100
	rng = RandomNumberGenerator.new()
	count = 0
	limit  = get_viewport_rect().size
	rng.randomize()
	position.x = rng.randi_range(0, int(limit.x))
	position.y = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if	randi() % 2:
		t += delta

	# dobre stava sys zavoq ama ... mnogo burzi , neznam kak da namalq skorostta
	#position = _cubic_bezier(
	#	Vector2(position.x, position.y), 
	#	Vector2(position.x+5 , limit.y/2), 
	#	Vector2(position.x+10, limit.y/2), 
	#	Vector2(position.x, 0), 
	#	t)
	#		
	#if	int(position.y) == limit.y/2:
	#	_shoot()
	move = Vector2()
	_move()
	position += move * speed * delta



func _cubic_bezier(p0: Vector2, p1: Vector2, p2: Vector2, p3: Vector2, t: float):
	var q0 = p0.linear_interpolate(p1, t)
	var q1 = p1.linear_interpolate(p2, t)
	var q2 = p2.linear_interpolate(p3, t)

	var r0 = q0.linear_interpolate(q1, t)
	var r1 = q1.linear_interpolate(q2, t)

	var s = r0.linear_interpolate(r1, t)
	return s


func _move():
	if (back) :
		move.y -= 1
		position.y -= 1
	else :
		move.y += 1
		position.y += 1
		
	if	int(position.y) > limit.y/2 :
		back = true
		
	if int(position.y) == limit.y/4 || int(position.y) == limit.y/2:
		if get_parent().has_node("Player"):
			_shoot()


func _shoot():
	#var bullet = load("res://BulletEnemy.tscn")
	#var b = bullet.instance()
	#add_child(b)
	var bulletInstance = bullet.instance()
	bulletInstance.position = Vector2(position.x, position.y -20)
	get_tree().get_root().add_child(bulletInstance)
	
func _getCurrentPosition():
	return position


