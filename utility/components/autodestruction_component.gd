@icon("res://icons/icons8-cross-32.png")
extends Node

@export var delay = 3000.0

var parent: Node

func _ready() -> void:
	parent = get_parent()
	var timer: Timer = get_node("Timer")
	timer.wait_time = delay
	timer.start()

func handle_destruction() -> void:
	parent.queue_free()