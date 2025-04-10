@icon("res://icons/icons8-missile-32.png")
extends Area2D

@export var speed = -500.0
@export var damage_factory: DamageFactory

var velocity: Vector2

func _ready() -> void:
	velocity = Vector2(0, speed)

func _physics_process(delta: float) -> void:
	position += velocity * delta

func _on_body_entered(body:Node2D) -> void:
	if body.is_in_group('damagable'):
		body.take_damage(damage_factory.produce())
	queue_free()
