extends Node2D
onready var sprite = load("res://Game.tscn")



var player
var enemies
var score
var limit
var rng
var font
var life


func _ready():
	limit  = get_viewport_rect().size
	rng = RandomNumberGenerator.new()
	sprite.instance()
	player = get_node("Player")
	enemies = []
	score = get_node("Score")
	life = get_node("Life")


func _process(delta):
	rng.randomize()
	var random = rng.randi_range(-500,10)
	if	random > 0 :
		var enemy = load("res://Enemy.tscn")
		var e = enemy.instance()
		add_child(e)
		enemies.push_front(e)
	if	life.life == 0 :
		get_tree().paused = true



func _getEnemies():
	return enemies
	
func _setScore(s):
	score._setScore()


func _setLife():
	player._setLife()
	life._setLife()
	_getLostWindow()


func _resetPlay():
	var p = load("res://Player.tscn")
	player = p.instance()
	add_child(player)

	for e in enemies :
		if	e != null :
			e.queue_free()

func _getLostWindow():
	var popup = WindowDialog.new()
	popup.set_title("You lost a life !!! NOOB")
	popup.popup(Rect2(limit.x, limit.y, 100, 50))
	popup.set_position(limit/2)
	add_child(popup)
	popup.show()
	yield(get_tree().create_timer(4.0), "timeout")
	_resetPlay()
	popup.hide()
	
