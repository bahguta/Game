extends Area2D

var speed = 2000
var limit
var success = false


func _ready():
	print("Shooting projectile")


func _process(delta):
	position -= transform.y * speed * delta

func _getCurrentPosition():
	return position

func _isSuccess() :
	return success

func _on_Bullet_area_entered(area):
	if ("Enemy" in area.get_name()) :
		area.queue_free()
		queue_free()
		_boom(area)
		get_parent().get_parent()._setScore()

func _boom(area):
	var boom = get_parent().get_parent().get_node("Boom")
	boom.position.x = area.position.x
	boom.position.y = area.position.y
	boom.set_frame(0)
	boom.play()
	boom.get_node("AudioPlayer").play()
	yield(get_tree().create_timer(2.0), "timeout")
	boom.stop()
