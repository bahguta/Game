extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 40

# Called when the node enters the scene tree for the first time.
func _ready():
	raise()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.y * speed * delta


func _on_LifeBonus_area_entered(area):
	if ("Player" in area.get_name()) :
		get_tree().get_root().get_node("Game")._add_life()
		queue_free()
