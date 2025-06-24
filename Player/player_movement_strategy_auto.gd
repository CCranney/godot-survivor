class_name PlayerMovementStrategyAuto extends PlayerMovementStrategy

var agent: NavigationAgent3D

func _init(_agent: NavigationAgent3D, _target_position: Vector3) -> void:
		agent = _agent
		agent.target_position = _target_position

func get_input_direction() -> Vector2:
	if agent.is_navigation_finished():
		return Vector2.ZERO
		
	var next_position := agent.get_next_path_position()
	var direction = next_position - agent.get_parent().global_position
	if direction.length() > 0.01:
		direction = direction.normalized()
		return Vector2(direction.x, direction.z)
	
	return Vector2.ZERO
