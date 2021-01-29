extends Node2D

# var players []  = ??? Moje multiplayer da se probva 
var player
var enemies
var score
var limit
var rng
var life
var player_life
var boss
var boss_loaded
onready var gameover_dialog = get_node("GameOverDialog")
onready var BOSS = load("res://Boss.tscn")



func _ready():
	limit  = get_viewport_rect().size
	rng = RandomNumberGenerator.new()
	player = get_node("Player")
	enemies = []
	score = get_node("Score")
	life = get_node("Life")
	# s po 3 jivotcheta :) 
	player_life = 3
	life._setLife(player_life)
	boss_loaded = false


func _process(delta):
	if	enemies.size() >= 50:
		if	!boss_loaded:
			#var b = load("res://Boss.tscn")
			boss = BOSS.instance()
			add_child(boss)
			boss_loaded = true
		elif boss && boss.life <= 0:
			boss_loaded = false
			enemies = []
	else:
		_enemy_spotted()

func _getEnemies():
	return enemies
	
	
func _setScore():
	score._setScore()
	
	
func _enemy_spotted():
	rng.randomize()
	var random = rng.randi_range(-500,50)
	if	random > 0 :
		var enemy = load("res://Enemy.tscn")
		var e = enemy.instance()
		add_child(e)
		enemies.push_front(e)
		

func _lostLife():
	if	player_life == 0:
		gameover_dialog.show()
	else :
		_getLostWindow()
		player_life -= 1
		life._setLife(player_life)
		

func _resetPlay():
	var p = load("res://Player.tscn")
	player = p.instance()
	add_child(player)
	if	boss && boss_loaded:
		boss.queue_free()
		boss_loaded = false
	for e in enemies :
		if	e != null :
			e.queue_free()
	enemies = []

func _getLostWindow():
	var popup = WindowDialog.new()
	popup.popup_centered(Vector2(50, 0))
	popup.set_title("You lost a life !!! NOOB :D")
	popup.set_position(limit/2)
	add_child(popup)
	popup.show()
	yield(get_tree().create_timer(4.0), "timeout")
	_resetPlay()
	popup.hide()
	

func _getGameOverWindow():
	gameover_dialog.show()
	

func _on_LostDialog_confirmed():
	player_life = 3
	life._setLife(player_life)
	score._gameover()
	_resetPlay()
	gameover_dialog.hide()
	

func _set_boss_score():
	score._set_boss_score()
	#_getGameOverWindow()
