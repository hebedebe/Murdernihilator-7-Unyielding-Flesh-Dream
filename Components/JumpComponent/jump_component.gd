class_name JumpComponent extends Node

signal jumped

@export_category("Links")
@export var velocity_component: VelocityComponent
@export var body: CharacterBody3D

@export_category("Parameters")
@export var jump_velocity: float = 10

#region Signal targets
func on_jump_requested() -> void:
	if body.is_on_floor():
		velocity_component.velocity.y = jump_velocity
		jumped.emit()
#endregion
