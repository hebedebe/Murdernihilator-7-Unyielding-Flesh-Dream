class_name KnockbackComponent extends Node

signal knocked_back(strength: float, direction: Basis)
signal knocked_back_no_args

@export_category("Links")
@export var velocity_target: Node

func apply_velocity(target: Node, vel: Vector3) -> void:
	if "velocity" in target:
		target.velocity += vel
	elif "linear_velocity" in target:
		target.linear_velocity += vel

func get_velocity(target: Node) -> Vector3:
	if "velocity" in target:
		return target.velocity
	elif "linear_velocity" in target:
		return target.linear_velocity
	return Vector3.ZERO

func knockback(strength: float, direction: Basis) -> void:
	var impulse = direction * Vector3(0,0,-strength)
	apply_velocity(velocity_target, impulse)
	knocked_back.emit(strength, direction)
	knocked_back_no_args.emit()
	
