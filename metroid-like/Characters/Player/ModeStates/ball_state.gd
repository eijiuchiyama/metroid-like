extends State

@export var human_state: State
@onready var collision_human = get_parent().get_parent().get_node("CollisionShapeHuman")
@onready var collision_ball = get_parent().get_parent().get_node("CollisionShapeBall")

func init_state() -> void:
	player_arm.hide()
	animation_manager.toggle_sprite("ball")
	collision_human.disabled = true
	collision_ball.disabled = false
	
func update_state() -> void:
	if Input.is_action_just_pressed("up"):
		state_manager.switch_state(human_state)
