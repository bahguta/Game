extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 2000
var limit
var success = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Shooting projectile")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position -= transform.y * speed * delta

func _getCurrentPosition():
	return position


func _on_Bullet_area_entered(area):
	if ("Enemy" in area.get_name()) :
		area.queue_free()
		queue_free()
		get_parent().get_parent()._setScore(1)

func _isSuccess() :
	return success
