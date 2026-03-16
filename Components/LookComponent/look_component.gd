class_name LookComponent extends Node

@export var body: CharacterBody3D
@export var neck: Node3D

@export var pitch_limit_degrees: float = 89.0

func _ready() -> void:
	if not body:
		body = get_parent() as CharacterBody3D
	assert(body != null, "LookComponent needs a CharacterBody3D (set 'body' export or be a child of one).")
	assert(neck != null, "LookComponent needs a 'neck' Node3D assigned in the inspector.")

#region Signal targets
func on_look_input(delta: Vector2) -> void:
	body.rotate_y(delta.x)
	neck.rotate_x(delta.y)
	neck.rotation.x = clampf(neck.rotation.x, deg_to_rad(-pitch_limit_degrees), deg_to_rad(pitch_limit_degrees))
#endregion
