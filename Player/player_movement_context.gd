class_name PlayerMovementContext

var strategy: PlayerMovementStrategy

func update_strategy(type: String, player: CharacterBody3D = null, target: Vector3 = Vector3.ZERO) -> void:
	match type:
		"user":
			strategy = PlayerMovementStrategyUser.new()
		"auto":
			strategy = PlayerMovementStrategyAuto.new(player.test_navigation_agent_3d, target)

func get_input_direction() -> Vector2:
	return strategy.get_input_direction()
