extends State

@export
var idle_state : State

func init_state() -> void:
	print("Entering walk state")
	
func update_state() -> void:
		player_body.move_and_collide(Vector2(player_body.horizontal_speed, 0))
		if not Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
			state_manager.switch_state(idle_state)
