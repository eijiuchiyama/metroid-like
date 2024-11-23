extends Node
# This movement makes the enemy walk on the platform periodically without falling off

# INCOMPLETE

var body: Node
@onready var left_plataform_detector = get_parent().get_node("Left_Detector")
@onready var right_plataform_detector = get_parent().get_node("Right_Detector")
@onready var sprite = get_parent().get_node("Sprite")

const max_fall_speed: int = 1000
const gravity: int = 980

@export var velocity = 100
var move_direction = 1 # 1 for clockwise, -1 for counter clockwise
var up_direction = [Vector2.UP, Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT]
var up_direction_id = 0
var sprite_width
var sprite_height

func _enter_tree() -> void:
	body = get_parent()

func _ready() -> void:
	sprite_height = sprite.texture.get_height()
	sprite_width = sprite.texture.get_width()

func move(delta: float) -> void:
	print(body.velocity)
	check_direction()
	body.move_and_slide()

func check_direction():
	if body.is_on_wall():
		print("wall")
		body.position += up_direction[(up_direction_id + move_direction) % 4] * sprite_width / 2
		body.position += -1 * up_direction[up_direction_id] * sprite_height / 2
		up_direction_id = (up_direction_id + move_direction) % 4
		body.position += up_direction[(up_direction_id + move_direction) % 4] * sprite_width / 2
		body.position += -1 * body.up_direction * sprite_height / 2
	elif (not left_plataform_detector.is_colliding() and right_plataform_detector.is_colliding() and move_direction == -1) or\
		(left_plataform_detector.is_colliding() and not right_plataform_detector.is_colliding() and move_direction == 1):
		print("border")
		up_direction_id = (up_direction_id - move_direction) % 4
	
	if left_plataform_detector.is_colliding() or right_plataform_detector.is_colliding():
		print("fall")
		body.velocity = up_direction[(up_direction_id + move_direction) % 4] * velocity
	
	body.rotation = up_direction_id * 90
	body.up_direction = up_direction[up_direction_id]
	body.velocity += -1 * body.up_direction * 10
