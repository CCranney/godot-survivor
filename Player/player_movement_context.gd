class_name PlayerMovementContext

var strategy: PlayerMovementStrategy

const MOVEMENT_CONSTANTS = preload("res://Constants/movement_constants.gd")


func update_strategy(type: int, player: CharacterBody3D = null, target: Vector3 = Vector3.ZERO) -> void:
	match type:
		MOVEMENT_CONSTANTS.MovementTypes.USER:
			strategy = PlayerMovementStrategyUser.new()
		MOVEMENT_CONSTANTS.MovementTypes.AUTO:
			strategy = PlayerMovementStrategyAuto.new(player.test_navigation_agent_3d, target)

func get_input_direction() -> Vector2:
	return strategy.get_input_direction()
