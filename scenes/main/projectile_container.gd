extends Node

func _on_player_projectile_fired(target: Node2D) -> void:
	add_child(target)

func _on_enemy_projectile_fired(target: Node2D) -> void:
	add_child(target)