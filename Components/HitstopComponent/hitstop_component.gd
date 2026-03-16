class_name HitstopComponent extends Node

signal hitstopped
signal hitstop_ended

@export var delay: float = 0.02
@export var duration: float = 0.2


#region Signal targets
func hitstop():
	hitstopped.emit()
	await get_tree().create_timer(delay, true, false, true).timeout
	get_tree().paused = true
	await get_tree().create_timer(duration, true, false, true).timeout
	get_tree().paused = false
	hitstop_ended.emit()
#endregion
