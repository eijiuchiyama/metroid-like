extends BaseMovementState

@export var idle_state: State
@export var player: Player

func init_state() -> void:
	player_sprite.play("jump")
	
func update_state() -> void:
	if player.is_on_floor():
		state_manager.switch_state(idle_state)
