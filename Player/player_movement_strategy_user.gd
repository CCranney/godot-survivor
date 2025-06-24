class_name PlayerMovementStrategyUser extends PlayerMovementStrategy

func get_input_direction() -> Vector2:
	return Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
