class_name VelocityComponent extends Node

signal velocity_updated(new_velocity)

@export var bodies_to_update: Array[Node3D]

var velocity: Vector3 = Vector3.ZERO:
	set(new_velocity):
		velocity = new_velocity
		velocity_updated.emit(velocity)
		for body in bodies_to_update:
			if "velocity" in body:
				body.velocity = velocity


#region Signal targets
func set_velocity(new_velocity: Vector3) -> void:
	velocity = new_velocity
#endregion
