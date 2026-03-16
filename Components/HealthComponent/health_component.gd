class_name HealthComponent extends Node

signal health_changed(new_health: float, delta: float)
signal died
signal revived

@export var max_health: float = 100.0

var health: float = max_health:
	set(value):
		var clamped := clampf(value, 0.0, max_health)
		var delta := clamped - health
		if delta == 0.0:
			return
		health = clamped
		health_changed.emit(health, delta)
		if health <= 0.0 and is_alive:
			is_alive = false
			died.emit()

var is_alive: bool = true

func damage(amount: float) -> void:
	health -= amount

func heal(amount: float) -> void:
	health += amount

func reset() -> void:
	is_alive = true
	health = max_health   # setter fires health_changed
	revived.emit()
