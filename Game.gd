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
var is_helped
onready var gameover_dialog = get_node("GameOverDialog")
onready var BOSS = load("res://Boss.tscn")
onready var Help = load("res://Helper.tscn")


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
	is_helped = false

func _process(delta):
	print(enemies.size())
	if	enemies.size() >= 10:
		if	!boss:
			boss = BOSS.instance()
			add_child(boss)
			boss_loaded = true
		else:
			if	boss.life <= 0 :
			#boss_loaded = false
				enemies.clear()
				#if player:
					#player._add_helper()
				var b = load("res://HelperBonus.tscn")
				var helperBonus = b.instance()
				helperBonus.position.x = boss.position.x + 80
				helperBonus.position.y = boss.position.y + 10
				get_tree().get_root().add_child(helperBonus)
	else:
		_enemy_spotted()

func _getEnemies():
	return enemies
	
	
func _setScore():
	score._setScore()
	
	
func _enemy_spotted():
	rng.randomize()
	var random = rng.randi_range(-500,10)
	if	random > 0 :
		var enemy = load("res://Enemy.tscn")
		var e = enemy.instance()
		enemies.push_front(e)
		get_tree().get_root().add_child(e)
		
		

func _lostLife():
	if	player_life == 0:
		gameover_dialog.show()
	else :
		player_life -= 1
		life._setLife(player_life)
		_getLostWindow()
		_resetPlay()
		
		#if	player:
		#	player._remove_all_helpers()
	#if	get_tree().get_root().get_node("Game").get_node("Helper"):
	#	get_tree().get_root().get_node("Game").remove_child(Help)
	
	#enemies.clear()
	
	



func _resetPlay():
	enemies.clear()
	if !player:
		var p = load("res://Player.tscn")
		player = p.instance()
		get_tree().get_root().add_child(player)
		#player._remove_all_helpers()
	#if	boss :
	#	boss.queue_free()
		
	for child in get_tree().get_root().get_children():
		if	"Boss" in child.get_name() || "Bullet" in child.get_name() || "BulletEnemy" in child.get_name() || "Enemy" in child.get_name() :
			child.queue_free()
		#boss_loaded = false
	#for e in enemies :
	#	if	e != null :
	#		e.queue_free()
	#enemies = []
	

func _getLostWindow():
	var popup = WindowDialog.new()
	popup.set_title("You lost a life !!! NOOB :D")
	popup.set_position(limit/2)
	add_child(popup)
	popup.show()
	
	yield(get_tree().create_timer(2.0), "timeout")
	popup.hide()
	#_resetPlay()

func _getGameOverWindow():
	add_child(gameover_dialog)
	gameover_dialog.show()
	

func _on_LostDialog_confirmed():
	player_life = 3
	life._setLife(player_life)
	score._gameover()
	_resetPlay()
	gameover_dialog.hide()
	

func _set_boss_score():
	score._set_boss_score()

func _add_life():
	player_life += 1
	life._setLife(player_life)
	

func _add_helper():
	player._add_helper()
	
	#var h = Help.instance()
	#if h.side:
	#	h.set_side(false)
	#	get_tree().get_root().add_child(h)
	#else:
	#	h.set_side(true)
	#if	!get_tree().get_root().has_node("Helper"):
	#	#var b = load("res://Helper.tscn")
	#	var helper = Help.instance()
	#	helper.position.x = player.position.x + 80
	#	helper.position.y = player.position.y + 10
	#	get_tree().get_root().add_child(helper)
		
	#	#var b2 = load("res://Helper.tscn")
	#	var helper2 = Help.instance()
	#	helper2.position.x = player.position.x - 80
	#	helper2.position.y = player.position.y + 10
	#	get_tree().get_root().add_child(helper2)
	#	is_helped = true
