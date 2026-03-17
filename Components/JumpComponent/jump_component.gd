class_name JumpComponent extends Node

signal jumped

@export_category("Links")
@export var velocity_component: VelocityComponent
@export var body: CharacterBody3D

@export_category("Parameters")
@export var jump_velocity: float = 10
@export var air_jumps: int = 0

var remaining_air_jumps: int

func _ready() -> void:
	reset_jumps()

#region Signal targets
func reset_jumps() -> void:
	remaining_air_jumps = air_jumps

func on_jump_requested() -> void:
	if body.is_on_floor():
		velocity_component.velocity.y = jump_velocity
		jumped.emit()
	elif remaining_air_jumps > 0:
		remaining_air_jumps -= 1
		velocity_component.velocity.y = jump_velocity
		jumped.emit()
#endregion
