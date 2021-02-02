extends Area2D


# Declare member variables here. Examples:
var limit
var move
var speed
var hold
var count
var go_right
var rng
var life
onready var bullet = load("res://BulletEnemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	limit  = get_viewport_rect().size
	rng = RandomNumberGenerator.new()
	position.x = limit.x/2
	position.y = 0
	speed = 40
	hold = false
	count = 0
	go_right = false
	life = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move = Vector2()
	_move()
	position += move * speed * delta


func _move():
	if go_right:
		_move_right()
	else:
		_move_left()
	if	position.y >= limit.y/4:
			if get_parent().has_node("Player"):
				_shoot()
	else:
		move.y += 1
		position.y += 1


func _shoot():
	if	count < 5:
		count += 1
	else:
		var random = rng.randi_range(-500,20)
		if	random > 0:
			var b = bullet.instance()
			b.position = Vector2(position.x, position.y -20)
			get_tree().get_root().add_child(b)
			count = 0


func _move_left():
	if	int(position.x) > 200 :
		position.x -= 1
	else:
		go_right = true


func _move_right():
	if	int(position.x) < 460 :
		position.x += 1
	else:
		go_right = false


func _rest_Life():
	life -= 1
