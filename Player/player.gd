extends CharacterBody3D

@export var test_target_object: Node3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var player_movement: PlayerMovementContext = PlayerMovementContext.new()
@onready var test_navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D


func _ready() -> void:
	player_movement.update_strategy("auto", self, test_target_object.global_position)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir := player_movement.get_input_direction()
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
