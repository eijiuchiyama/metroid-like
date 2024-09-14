extends BaseMovementState

@export
var idle_state : State

func init_state() -> void:
	pass
	
func update_state() -> void:
		if not Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
			state_manager.switch_state(idle_state)
