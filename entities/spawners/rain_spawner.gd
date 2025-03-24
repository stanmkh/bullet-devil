@icon("res://test_graphic/icons/icons8-rain-32.png")
@tool
extends Node2D

@export var width: float = 1200
@export var height: float = 200
@export var debug_color: Color = Color.RED
@export var enemy_to_spawn: PackedScene

var fill_color: Color = Color(debug_color.r, debug_color.g, debug_color.b, 0.5)

func _draw():
	if Engine.is_editor_hint():
		var rect = Rect2(Vector2(0, -height), Vector2(width, height))
		draw_rect(rect, fill_color, true, 0)
		draw_rect(rect, debug_color, false, 2.0)

func spawn_enemy():
	var enemy_instance = enemy_to_spawn.instantiate()
	var random_x = randf_range(0, width)
	var random_y = randf_range(0, -height)
	enemy_instance.position = Vector2(random_x, random_y)
	add_child(enemy_instance)