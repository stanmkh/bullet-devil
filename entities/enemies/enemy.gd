@icon("res://icons/icons8-enemy-32.png")
extends CharacterBody2D

@export var health_component: HealthComponent
@export var collision_damage_factory: DamageFactory

# TODO explain why?
@warning_ignore("UNUSED_SIGNAL")
signal projectile_fired

func _physics_process(_delta: float) -> void:
	move_and_slide()

func take_damage(damage: Damage):
	health_component.take_damage(damage)
	
