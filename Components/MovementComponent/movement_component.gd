class_name MovementComponent extends Node

@export_category("Links")
@export var body: CharacterBody3D
@export var model: Node3D

@export_category("Movement Parameters")
@export var speed: float = 8
@export var jump_velocity: float = 12
@export var gravity_multiplier: float = 3.0

var direction: Vector2 = Vector2.ZERO
var wants_jump: bool = false

func update(delta: float) -> void:
	if not body: return
	
	# Movement here
	body.velocity = body.transform.basis * Vector3(direction.x, 0, direction.y)
	
	# Gravity
	if not body.is_on_floor():
		body.velocity += body.get_gravity() * delta * gravity_multiplier
	
	# Jump
	if wants_jump and body.is_on_floor():
		body.velocity.y = jump_velocity
		wants_jump = false
		
	body.move_and_slide()
