extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 1000
var limit
var success = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Shooting projectile")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.y * speed * delta

func _getCurrentPosition():
	return position

func _body_entered(body):
	print(body.get_name())
	if (body.get_name() == "Player") :
		print("Ouch!")
		body.queue_free()
		queue_free()


func _on_BulletEnemy_area_entered(area):
	if ("Player" in area.get_name()) :
		area.queue_free()
		queue_free()
		success = true
		get_parent()._setLife()


func _isSuccess() :
	return success
