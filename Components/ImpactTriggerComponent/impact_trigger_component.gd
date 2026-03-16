class_name ImpactTriggerComponent extends Node

signal triggered

@export var physics_body: RigidBody3D
@export var impulse_threshold: float

func _physics_process(delta: float) -> void:
	var physics_state = PhysicsServer3D.body_get_direct_state(physics_body.get_rid())
	var total_impulse := Vector3.ZERO
	for i in physics_state.get_contact_count():
		total_impulse += physics_state.get_contact_impulse(i)
	var impulse_length_squared = total_impulse.length_squared()
	if impulse_length_squared >= impulse_threshold**2:
		triggered.emit()
		#print("Triggered (", impulse_length_squared, ")")
