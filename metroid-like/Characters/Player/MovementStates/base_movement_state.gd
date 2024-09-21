extends State
class_name BaseMovementState

func _process(delta: float) -> void:
	
	if (Input.is_action_just_pressed("left") or Input.is_action_pressed("left") and not Input.is_action_pressed("right")):
		player_body.horizontal_direction = -1
		player_sprite.flip_h = true
		weapon_manager.toggle_position("left")
	elif (Input.is_action_just_pressed("right") or Input.is_action_pressed("right") and not Input.is_action_pressed("left")):
		player_body.horizontal_direction = 1
		player_sprite.flip_h = false
		weapon_manager.toggle_position("right")
	elif not (Input.is_action_pressed("left") or Input.is_action_pressed("right")):
		player_body.horizontal_direction = 0
	
	if(Input.is_action_just_pressed("jump") and player_body.velocity.y >= 0 and player_body.is_on_floor()):
		player_body.velocity.y = -150
		
	player_body.velocity.y += 2
	
	player_body.velocity.x = 20*player_body.horizontal_direction
	
	player_body.move_and_slide()
