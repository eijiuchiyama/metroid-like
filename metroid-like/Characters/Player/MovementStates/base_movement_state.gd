extends State
class_name BaseMovementState

func _process(delta: float) -> void:
	player_body.move_and_collide(Vector2(player_body.horizontal_speed, player_body.vertical_speed))
