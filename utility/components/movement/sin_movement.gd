extends AbstractMovement

var amplitude := 200.0
var frequency := 10.0
var time_passed := 0.0

func _physics_process(delta: float):
	time_passed += delta
	parent.velocity.y = speed
	parent.velocity.x = sin(time_passed * frequency) * amplitude
	parent.velocity.rotated(parent.rotation) 
