class_name InputComponent extends Node

signal move_direction_changed(direction: Vector2)
signal jump_requested
signal kick_requested
signal look_input(delta: Vector2) # Radians

@export var mouse_sensitivity: float = 0.3

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		var delta := Vector2(
			deg_to_rad(-event.relative.x * mouse_sensitivity),
			deg_to_rad(-event.relative.y * mouse_sensitivity)
		)
		look_input.emit(delta)

	if event.is_action_pressed("jump"):
		jump_requested.emit()
		
	if event.is_action_pressed("kick"):
		kick_requested.emit()

	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _physics_process(_delta: float) -> void:
	var direction : Vector2 = Input.get_vector(
		"move_left", "move_right", 
		"move_forward", "move_backward"
	)
	move_direction_changed.emit(direction)
