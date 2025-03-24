@icon("res://test_graphic/icons/icons8-enemy-32.png")
extends CharacterBody2D

@export var speed = 500.0
@export var health_component: HealthComponent

func _ready() -> void:
	velocity.y = speed

func _physics_process(_delta: float) -> void:
	move_and_slide()
	var collision_count = get_slide_collision_count()
	for i in range(collision_count):
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider.is_in_group("damagable"):
			collider.take_damage(9999)  # TODO: provide proper value
			queue_free()

func take_damage(damage: float):
	health_component.take_damage(damage)
	
