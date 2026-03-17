class_name MovementComponent extends Node

@export_category("Movement Parameters")
@export var acceleration: float = 8.0
@export var jump_velocity: float = 12.0
@export var gravity_multiplier: float = 3.0

@export_category("Links")
@export var body: CharacterBody3D
@export var velocity_component: VelocityComponent

var move_direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	if not body:
		var parent = get_parent()
		assert(parent is CharacterBody3D, "Body must be assigned or parent must be CharacterBody3D")
		body = parent
	assert(velocity_component, "Velocity component must be assigned")
		

func _physics_process(delta: float) -> void:
	# Horizontal movement
	var wish_dir := body.transform.basis * Vector3(move_direction.x, 0, move_direction.y)
	velocity_component.velocity.x += wish_dir.x * acceleration
	velocity_component.velocity.z += wish_dir.z * acceleration
	
	body.move_and_slide()

#region Signal targets
func on_move_direction_changed(direction: Vector2) -> void:
	move_direction = direction
#endregion
