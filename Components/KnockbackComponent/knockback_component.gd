class_name KnockbackComponent extends Node

signal knocked_back(strength: float, direction: Basis)

@export_category("Links")
@export var velocity_target: Node

func knockback(strength: float, direction: Basis) -> void:
	var impulse = direction * Vector3(0,0,-strength)
	if "velocity" in velocity_target:
		velocity_target.velocity += impulse
	elif "linear_velocity" in velocity_target:
		velocity_target.linear_velocity += impulse
	knocked_back.emit(strength, direction)
	
