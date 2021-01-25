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


func _on_Bullet_area_entered(area):
	if ("Enemy" in area.get_name()) :
		area.queue_free()
		queue_free()
		get_parent().get_parent()._setScore()

func _isSuccess() :
	return success
