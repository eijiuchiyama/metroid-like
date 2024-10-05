extends State 

@export 
var ball_state : State 

func init_state() -> void: 
	player_arm.show()
	animation_manager.toggle_sprite("human")
	
func update_state() -> void:
	if Input.is_action_just_pressed("down") and not (Input.is_action_pressed("left") or Input.is_action_pressed("right")):
		state_manager.switch_state(ball_state)
