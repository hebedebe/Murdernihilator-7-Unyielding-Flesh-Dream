class_name VelocityComponent extends Node

signal velocity_updated(new_velocity)

@export var target_node: Node
@export var target_variable: String = "velocity"

var velocity: Vector3:
	set(new_velocity):
		velocity = new_velocity
		target_node.set(target_variable, new_velocity)
		velocity_updated.emit(new_velocity)
	get():
		var new_vel = target_node.get(target_variable)
		return new_vel

func _ready() -> void:
	assert(target_variable in target_node, "VelocityComponent requires a valid target_variable")

#region Signal targets
func set_velocity(new_velocity: Vector3) -> void:
	velocity = new_velocity
#endregion
