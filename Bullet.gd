extends Area2D

var speed = 2000
onready var root = get_tree().get_root().get_node("Game")
#onready var boom = root.get_node("Boom")


func _ready():
	pass

func _process(delta):
	position -= transform.y * speed * delta

func _getCurrentPosition():
	return position

func _on_Bullet_area_entered(area):
	if ("Enemy" in area.get_name()) :
		area.queue_free()
		queue_free()
		_boom(area)
		root._setScore()
	elif ("Boss" in area.get_name()) :
		queue_free()
		var boss = root.get_node("Boss")
		if 	boss.life != 0:
			boss._rest_Life()
		else:
			boss.queue_free()
			root._set_boss_score()
			_boom(area)
		

func _boom(area):
	var b = load("res://Boom.tscn")
	var boom = b.instance()
	boom.position.x = area.position.x
	boom.position.y = area.position.y
	get_tree().get_root().add_child(boom)
	boom.set_frame(0)
	boom.play()
	boom.get_node("AudioPlayer").play()
