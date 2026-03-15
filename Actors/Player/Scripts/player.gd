class_name Player extends CharacterBody3D

@onready var input_component: InputComponent = %InputComponent
@onready var movement_component: MovementComponent = %MovementComponent

@onready var neck: Node3D = $Neck

func _ready() -> void:
	input_component.mouse_movement.connect(look)

func _physics_process(delta: float) -> void:
	# READ INPUT
	input_component.update()
	
	# MOVEMENT
	movement_component.direction = input_component.move_direction
	movement_component.wants_jump = input_component.jump_pressed
	movement_component.update(delta)
	
func look(mouse_input: Vector2) -> void:
	rotate_y(mouse_input.x)
	neck.rotate_x(mouse_input.y)
	neck.rotation.z = clampf(neck.rotation.z, -89, 89)
