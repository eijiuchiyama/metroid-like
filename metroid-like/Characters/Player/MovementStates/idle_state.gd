extends BaseMovementState

@export 
var walk_state : State

func init_state() -> void:
	player_sprite.play("idle")
	
func update_state() -> void:
	if player_body.velocity.x != 0:
		state_manager.switch_state(walk_state)
