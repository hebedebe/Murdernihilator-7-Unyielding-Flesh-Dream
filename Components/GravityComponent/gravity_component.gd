class_name GravityComponent extends Node

@export_category("Links")
@export var velocity_component: VelocityComponent

@export_category("Parameters")
@export var gravity: Vector3 = Vector3(0,-9.82,0)
@export var gravity_scale: float = 1
@export var apply_gravity: bool = true

func _ready() -> void:
	assert(velocity_component, "GravityComponent must be assigned a VelocityComponent")

func _physics_process(delta: float) -> void:
	velocity_component.velocity += gravity * gravity_scale * delta

func get_gravity() -> Vector3:
	return gravity * gravity_scale

func enable_gravity():
	apply_gravity = true
	
func disable_gravity():
	apply_gravity = false
