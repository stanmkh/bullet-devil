@tool
@icon("res://test_graphic/icons/icons8-medical-cross-32.png")
class_name HealthComponent
extends Node

@export var amount: float = 100
var parent

func _ready() -> void:
    parent = get_parent()

func _get_configuration_warnings() -> PackedStringArray:
    var warnings:PackedStringArray = []
    if not get_parent().has_method("take_damage"):
        warnings.append("Parent of Health should implement method take_damage, this method should forward call to Health.take_damage")
    if not get_parent().is_in_group("damagable"):
        warnings.append("Parent of Health should be in group 'damagable'")
    return warnings

func _process(_delta: float) -> void:
    if is_dead():
        parent.queue_free()

func is_dead() -> bool:
    return amount <= 0

func take_damage(damage: float):
    amount -= damage