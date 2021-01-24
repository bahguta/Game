extends Node

var timer

func _init():
	timer = Timer.new()
	add_child(timer)
	timer.autostart = true
	timer.wait_time = 2
	timer.connect("timeout", self, "_timeout")


func _timeout():
	print("Timed out!")
