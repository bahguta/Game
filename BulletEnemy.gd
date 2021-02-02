extends Area2D


# Declare member variables here. Examples:
var speed = 600
onready var root = get_tree().get_root().get_node("Game")
#onready var boom = root.get_node("Boom")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.y * speed * delta


func _getCurrentPosition():
	return position


func _on_BulletEnemy_area_entered(area):
	print(area.get_name())
	if ("Player" in area.get_name()) :
		root.get_node("Player")._remove_all_helpers()
		area.queue_free()
		queue_free()
		_boom(area)
		root._lostLife()
	elif "Helper" in area.get_name() :
		#if	root.get_node("Player"):
		root.get_node("Player")._remove_helper(area)
		area.queue_free()
		queue_free()
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
