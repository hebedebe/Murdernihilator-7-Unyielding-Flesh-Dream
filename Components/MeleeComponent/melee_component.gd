class_name MeleeComponent extends Node

signal attacked
signal attack_landed
signal attack_missed

@export_category("Links")
@export var melee_area: Area3D
@export var knockback_direction_pointer: Node3D

@export_category("Parameters")
@export var damage: float;
@export var knockback: float;
@export var ignored_bodies: Array[PhysicsBody3D]

func _ready() -> void:
	assert(melee_area, "Melee component must be assigned an area3d node")
	assert(knockback_direction_pointer, "Melee component must be assigned a knockback direction pointer")

#region Signal targets
func attack() -> void:
	var did_attack_hit: bool = false
	var overlaps: Array[Node3D] = melee_area.get_overlapping_bodies()
	for body in overlaps:
		if body not in ignored_bodies:
			print("Knocked back ", body.name)
			
			if body.has_node("%HealthComponent"):
				body.get_node("%HealthComponent").damage(damage)
				did_attack_hit = true
				
			if body.has_node("%KnockbackComponent"):
				body.get_node("%KnockbackComponent").knockback(knockback, knockback_direction_pointer.transform.basis)
				did_attack_hit = true
	attacked.emit()
	if did_attack_hit:
		attack_landed.emit()
	else:
		attack_missed.emit()
			
#endregion
