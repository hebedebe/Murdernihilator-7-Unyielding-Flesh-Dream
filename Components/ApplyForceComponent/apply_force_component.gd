class_name ApplyForceComponent extends Node

@export var force: Vector3

#region Signal targets
func apply(body, delta: float = 1):
	if body.has_node("VelocityComponent"):
		var velocity_component: VelocityComponent = body.get_node("VelocityComponent")
		if velocity_component:
			velocity_component.velocity += force * delta
#endregion
