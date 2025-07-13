extends Node
class_name AbstractMovement

var parent

@export var speed = 200.0

func _ready() -> void:
	parent = get_parent()

func _get_configuration_warnings() -> PackedStringArray:
	var warnings:PackedStringArray = []
	if not (get_parent() is CharacterBody2D):
		warnings.append("Movement Component parent should inherit from CharacterBody2D")
	return warnings

func update_movement(_delta: float):
	push_error("Abstract version of update_movement was called")
