extends BaseMovementState

@export var idle_state : State
@export var jump_state: State

func init_state() -> void:
	player_sprite.play("walking")
	
func update_state() -> void:
	if player_body.velocity.x == 0:
		state_manager.switch_state(idle_state)
	if Input.is_action_just_pressed("jump"):
		state_manager.switch_state(jump_state)
