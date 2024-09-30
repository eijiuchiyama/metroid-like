extends State

@export var human_state: State

func init_state() -> void:
	player_sprite.play("ball")
	
func update_state() -> void:
	if Input.is_action_just_pressed("jump"):
		state_manager.switch_state(human_state)
