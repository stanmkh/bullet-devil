extends Resource

class_name DamageFactory

@export var amount = 100.0

func produce():
    return Damage.new(amount)