@tool
@icon("res://test_graphic/icons/icons8-collision-32.png")
extends Node

@export var collision_damage_factory: DamageFactory
var parent

func _ready() -> void:
    parent = get_parent()

func _get_configuration_warnings() -> PackedStringArray:
    var warnings:PackedStringArray = []
    if not get_parent() is CharacterBody2D:
        warnings.append("Parent of CollisionDamageComponent must be a CharacterBody2D")
    return warnings

func _physics_process(_delta: float) -> void:
    var collision_count = parent.get_slide_collision_count()
    for i in range(collision_count):
        var collision = parent.get_slide_collision(i)
        var collider = collision.get_collider()
        if collider and collider.is_in_group("damagable"):
            if collider.has_method("take_damage"):
                collider.take_damage(collision_damage_factory.produce())
            parent.queue_free()