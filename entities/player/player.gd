@icon("res://test_graphic/icons/icons8-human-32.png")
extends CharacterBody2D

@export var speed = 500.0
@export var fire_controller: Node2D
@export var health_component: HealthComponent

signal projectile_fired

func _process(_delta: float) -> void:
	if (Input.is_action_pressed("attack")):
		# print(fire_controller)
		fire_controller.try_fire()
	if health_component.is_dead():
		get_tree().quit()  # TODO: Implement game over instead

func _physics_process(_delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
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


func _on_fire_controller_projectile_fired(target: Node2D) -> void:
	projectile_fired.emit(target)
	
func take_damage(damage: float):
	health_component.take_damage(damage)
