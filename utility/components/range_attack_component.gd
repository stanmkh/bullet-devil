@icon("res://test_graphic/icons/icons8-sword-32.png")
extends Node2D

@export var fire_rate = 100.0
@export var projectile_to_fire: PackedScene
@export var projectile_spawn_location: Node2D

signal projectile_fired

var _last_fire_timestampt = 0.0

func try_fire():
	var current_timestamp = Time.get_ticks_msec()
	if (current_timestamp > _last_fire_timestampt + fire_rate):
		_last_fire_timestampt = current_timestamp
		fire()

func fire():
	var projectile: Node2D = projectile_to_fire.instantiate()
	projectile.global_position = projectile_spawn_location.global_position
	projectile_fired.emit(projectile)
