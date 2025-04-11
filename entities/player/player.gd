@icon("res://icons/icons8-human-32.png")
extends CharacterBody2D

@export var speed = 500.0
@export var health_component: HealthComponent
@export var fire_rate = 100.0
@export var projectile_to_fire: PackedScene
@export var projectile_spawn_location: Node2D

var _last_fire_timestampt = 0.0

signal projectile_fired
signal died

func _process(_delta: float) -> void:
	if (Input.is_action_pressed("attack")):
		try_fire()

func _physics_process(_delta: float) -> void:
	var xDirection := Input.get_axis("ui_left", "ui_right")
	var yDirection := Input.get_axis("ui_up", "ui_down")
	if xDirection:
		velocity.x = xDirection * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	if yDirection:
		velocity.y = yDirection * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()
	
func take_damage(damage: Damage):
	health_component.take_damage(damage)

func _on_health_component_died() -> void:
	died.emit()

func try_fire():
	var current_timestamp = Time.get_ticks_msec()
	if (current_timestamp > _last_fire_timestampt + fire_rate):
		_last_fire_timestampt = current_timestamp
		fire()

func fire():
	var projectile: Node2D = projectile_to_fire.instantiate()
	projectile.rotation = rotation
	projectile.global_position = projectile_spawn_location.global_position
	projectile_fired.emit(projectile)
