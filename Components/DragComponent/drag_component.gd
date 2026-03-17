class_name DragComponent extends Node

@export_category("Links")
@export var velocity_component: VelocityComponent

@export_category("Parameters")
@export var drag: Vector3 = Vector3.ONE;
@export var drag_scale: float = 1

func _ready() -> void:
	assert(velocity_component, "DragComponent must be assigned a VelocityComponent")
	
func _physics_process(delta: float) -> void:
	velocity_component.velocity *= Vector3.ONE - (drag * drag_scale * delta)

#region Signal targets
func set_drag_scale(new_drag_scale: float) -> void:
	drag_scale = new_drag_scale
	
func set_drag(new_drag: Vector3) -> void:
	drag = new_drag
#endregion
