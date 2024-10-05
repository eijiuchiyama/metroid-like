extends State

@export var idle_state: State
@export var player: Player

func init_state() -> void:
	animation_manager.toggle_animation("jump")
	
func update_state() -> void:
	if player.is_on_floor():
		state_manager.switch_state(idle_state)
