extends Node
# This movement makes the enemy walk on the platform periodically without falling off

var body: Node
@onready var left_plataform_detector = get_parent().get_node("Left_Detector")
@onready var right_plataform_detector = get_parent().get_node("Right_Detector")

const max_fall_speed: int = 1000
const gravity: int = 980

@export var velocity = 100
var direction = 1

func _enter_tree() -> void:
	body = get_parent()

func move(delta: float) -> void:
	body.velocity.y = min(body.velocity.y + gravity * delta, max_fall_speed) if not body.is_on_floor() else 0
	check_direction()
	
	body.velocity.x = velocity * direction
	body.move_and_slide()

func check_direction():
	if body.is_on_wall():
		direction *= -1
	elif not left_plataform_detector.is_colliding():
		direction = 1
	elif not right_plataform_detector.is_colliding():
		direction = -1
