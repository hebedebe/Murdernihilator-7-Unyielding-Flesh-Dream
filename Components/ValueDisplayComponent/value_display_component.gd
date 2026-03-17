class_name ValueDisplayComponent extends Label

@export var target_node: Node
@export var target_value_name: String

@export var use_format: bool = true
@export var format: String
@export var update_on_process: bool = true

func _ready() -> void:
	assert(target_node, "ValueDisplayComponent must be assigned a target node")
	assert(not target_value_name.is_empty(), "ValueDisplayComponent must be assigned a target value")
	assert(target_value_name in target_node, "ValueDisplayComponent's target node must contain the target value")
	
	
func _process(_delta: float) -> void:
	if update_on_process:
		update()

#region Signal targets
func update():
	var value = target_node.get(target_value_name)
	if use_format:
		text = format % value
	else:
		text = value.to_string()
#endregion
