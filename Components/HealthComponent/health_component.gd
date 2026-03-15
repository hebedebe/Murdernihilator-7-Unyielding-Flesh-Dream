class_name HealthComponent extends Node

signal health_updated(new_health)
signal health_decreased(amount)
signal health_increased(amount)
signal damaged(amount)
signal healed(amount)
signal died
signal health_reset

@export var max_health: float = 100
@export var health: float = 100:
	set(new_health):
		if new_health > health:
			health_increased.emit(new_health-health)
		elif new_health < health:
			health_decreased.emit(health-new_health)
		health = new_health
		health_updated.emit(new_health)
		if health <= 0:
			is_alive = false
			died.emit()
			
@export var is_alive: bool = true

func damage(amount: float):
	health -= amount
	damaged.emit(amount)

func heal(amount: float):
	health += amount
	healed.emit(amount)

func reset():
	health = max_health
	health_reset.emit()
