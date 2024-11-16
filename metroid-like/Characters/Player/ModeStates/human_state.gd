extends State 

@export var ball_state : State 
@onready var collision_human = get_parent().get_parent().get_node("CollisionShapeHuman")
@onready var collision_ball = get_parent().get_parent().get_node("CollisionShapeBall")

func init_state() -> void: 
	player_arm.show()
	animation_manager.toggle_sprite("human")
	collision_human.disabled = false
	collision_ball.disabled = true
	
func update_state() -> void:
	if Input.is_action_just_pressed("down") and not (Input.is_action_pressed("left") or Input.is_action_pressed("right")):
		state_manager.switch_state(ball_state)
