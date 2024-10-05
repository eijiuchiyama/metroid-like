extends State

@export var human_state: State

func init_state() -> void:
	player_arm.hide()
	animation_manager.toggle_sprite("ball")
	
func update_state() -> void:
	if Input.is_action_just_pressed("up"):
		state_manager.switch_state(human_state)
