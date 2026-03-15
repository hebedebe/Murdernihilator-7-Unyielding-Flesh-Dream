class_name InputComponent extends Node

signal mouse_movement(movement: Vector2)

@export var mouse_sensitivity: float = 0.5

var move_direction: Vector2 = Vector2.ZERO
var look_direction: Vector2 = Vector2.ZERO
var jump_pressed: bool = false

func update() -> void:
	move_direction = Input.get_vector(
		"move_left", "move_right", 
		"move_backward", "move_forward"
	)
	jump_pressed = Input.is_action_just_pressed("jump")
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		look_direction.x = deg_to_rad(event.relative.x * mouse_sensitivity)
		look_direction.y = deg_to_rad(-event.relative.y * mouse_sensitivity)
		mouse_movement.emit(look_direction)
