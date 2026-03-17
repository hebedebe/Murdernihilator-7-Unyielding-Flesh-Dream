class_name ExecuteOnAreaContentsComponent extends Node

signal overlapping_area_tick(area: Area3D, delta: float)
signal overlapping_body_tick(area: Node3D, delta: float)

@export_category("Links")
@export var area_3d: Area3D

@export_category("Parameters")
@export var tick_bodies: bool = true
@export var tick_areas: bool = false

func _ready() -> void:
	assert(area_3d, "ExecuteOnAreaContentsComponent requires an Area3D")

func _physics_process(delta: float) -> void:
	if tick_areas:
		for area in area_3d.get_overlapping_areas():
			overlapping_area_tick.emit(area, delta)
	
	if tick_bodies:
		for body in area_3d.get_overlapping_bodies():
			overlapping_body_tick.emit(body, delta)
		
