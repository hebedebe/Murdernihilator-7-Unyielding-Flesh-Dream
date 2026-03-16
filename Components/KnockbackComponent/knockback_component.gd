class_name KnockbackComponent extends Node

signal knocked_back(strength: float, direction: Basis)
signal knocked_back_no_args

@export_category("Links")
@export var velocity_component: VelocityComponent

func _ready() -> void:
	assert(velocity_component, "Knockback component requires velocity_component to be set.")

func knockback(strength: float, direction: Basis) -> void:
	var impulse = direction * Vector3(0,0,-strength)
	velocity_component.velocity += impulse
	knocked_back.emit(strength, direction)
	knocked_back_no_args.emit()
	
