extends State

@export 
var walk_state : State

func init_state() -> void:
	pass
	
func update_state() -> void:
	if Input.is_action_pressed("left"):
		player_body.horizontal_speed = -3
		state_manager.switch_state(walk_state)
	elif Input.is_action_pressed("right"):
		player_body.horizontal_speed = 3
		state_manager.switch_state(walk_state)
