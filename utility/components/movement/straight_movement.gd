extends AbstractMovement

func _physics_process(_delta: float):
	parent.velocity = Vector2.RIGHT.rotated(parent.rotation) * speed