extends State

@export var walk_state : State
@export var jump_state : State

func init_state() -> void:
	animation_manager.toggle_animation("idle")
	
func update_state() -> void:
	if player_body.velocity.x != 0:
		state_manager.switch_state(walk_state)
	if Input.is_action_just_pressed("jump"):
		state_manager.switch_state(jump_state)
