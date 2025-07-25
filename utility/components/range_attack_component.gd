@icon("res://icons/icons8-sword-32.png")
extends Node2D

@export var fire_rate = 1000.0
@export var projectile_to_fire: PackedScene
@export var projectile_spawn_location: Node2D
@export var spread_angle = 0.0

var _last_fire_timestampt = 0.0
var projectile_fired: Signal
var parent: Node2D
var spread_angle_rad

func _ready() -> void:
	parent = get_parent()
	projectile_fired = parent.projectile_fired
	spread_angle_rad = deg_to_rad(spread_angle)

func _get_configuration_warnings() -> PackedStringArray:
	var warnings:PackedStringArray = []
	if not get_parent().has_signal("projectile_fired"):
		warnings.append("Parent of RangeAttackComponent must have projectile_fired signal")
	return warnings

func _process(_delta: float) -> void:
	var current_timestamp = Time.get_ticks_msec()
	if (current_timestamp > _last_fire_timestampt + fire_rate):
		_last_fire_timestampt = current_timestamp
		fire()

func fire():
	var projectile: Node2D = projectile_to_fire.instantiate()
	print(spread_angle_rad)
	projectile.rotation = parent.rotation + randf_range(-spread_angle_rad, spread_angle_rad)
	projectile.global_position = projectile_spawn_location.global_position
	projectile_fired.emit(projectile)
