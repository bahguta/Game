extends Area2D


# Declare member variables here. Examples:
var speed = 1000
var limit
var success = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.y * speed * delta

func _getCurrentPosition():
	return position

func _body_entered(body):
	if (body.get_name() == "Player") :
		print("Ouch!")
		body.queue_free()
		queue_free()


func _on_BulletEnemy_area_entered(area):
	if ("Player" in area.get_name()) :
		area.queue_free()
		queue_free()
		success = true
		_boom(area)
		get_parent().get_parent()._lostLife()


func _isSuccess() :
	return success

func _boom(area):
	var boom = get_parent().get_parent().get_node("Boom")
	boom.position.x = area.position.x
	boom.position.y = area.position.y
	boom.set_frame(0)
	boom.play()
	boom.get_node("AudioPlayer").play()
