class_name BodyEventComponent extends Node

signal landed
signal left_floor

@export var body: CharacterBody3D

var on_floor_last_frame: bool

func _ready() -> void:
	on_floor_last_frame = body.is_on_floor()

func _physics_process(delta: float) -> void:
	var body_on_floor: bool = body.is_on_floor();
	if on_floor_last_frame != body_on_floor:
		if body_on_floor:
			landed.emit()
		else:
			left_floor.emit()
	on_floor_last_frame = body_on_floor
	
