extends RigidBody3D

@onready var overhead_sprite_symbol: Sprite3D = $OverheadSpriteSymbol
@onready var dialogue_enabled_shapecast: ShapeCast3D = $DialogueEnabledShapecast

var texture_arrow := preload("res://Assets/dialogue_indicator_arrow.svg")
var texture_button := preload("res://Assets/dialogue_indicator_button.svg") # example alternate

func _ready() -> void:
	overhead_sprite_symbol.texture = texture_button

func switch_sprite_symbol(is_within_speaking_range: bool) -> void:
	if is_within_speaking_range:
		overhead_sprite_symbol.texture = texture_button
	else:
		overhead_sprite_symbol.texture = texture_arrow

func _process(_delta: float) -> void:
	var is_player_in_range = false
	for collider_idx in dialogue_enabled_shapecast.get_collision_count():
		var collider = dialogue_enabled_shapecast.get_collider(collider_idx)
		if collider is Player:
			is_player_in_range = true
	switch_sprite_symbol(is_player_in_range)
