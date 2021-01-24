extends Area2D

#var speed = 0
var speed = 100
var move = Vector2()
var rng = RandomNumberGenerator.new()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var limit
var final
var count
var call
var back = false

# Called when the node enters the scene tree for the first time.
func _ready():
	count = 0
	limit  = get_viewport_rect().size
	final = limit
	rng.randomize()
	
	position.x = rng.randi_range(0, int(limit.x))
	position.y = 0
	
	final.x =  rng.randi_range(0, int(limit.x))
	final.y = rng.randi_range(0, int(limit.y/2))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move = Vector2()
	_move()
	position += move * speed * delta


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
		_shoot()


func _shoot():
	var bullet = load("res://BulletEnemy.tscn")
	var b = bullet.instance()
	add_child(b)
	
func _getCurrentPosition():
	return position

func _setLife():
	get_parent()._setLife()
	
