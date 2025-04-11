@icon("res://icons/icons8-enemy-32.png")
extends CharacterBody2D

@export var speed = 500.0
@export var health_component: HealthComponent
@export var collision_damage_factory: DamageFactory

@warning_ignore("UNUSED_SIGNAL")
signal projectile_fired

func _ready() -> void:
	velocity = Vector2.RIGHT.rotated(rotation) * speed

func _physics_process(_delta: float) -> void:
	move_and_slide()

func take_damage(damage: Damage):
	health_component.take_damage(damage)
	
