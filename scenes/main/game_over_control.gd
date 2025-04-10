extends Control


func _on_player_died() -> void:
	visible = true


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
