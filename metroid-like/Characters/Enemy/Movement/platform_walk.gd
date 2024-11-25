extends Node
# This movement makes the enemy walk on the platform periodically without falling off

var body: Node
@onready var sprite = get_parent().get_node("Sprite")
@onready var plataform_detector = get_parent().get_node("Plataform_Detector")

const max_fall_speed: int = 1000
const gravity: int = 980

@export var velocity = 100
var direction = 1
const change_delay = .1
var change_countdown = 0

func _enter_tree() -> void:
	body = get_parent()

func move(delta: float) -> void:
	change_countdown = max(change_countdown - delta, 0)
	if change_countdown == 0:
		check_direction()
	
	if body.is_on_floor():
		sprite.play("walk")
		body.velocity = Vector2(velocity * direction, 0)
	else:
		sprite.play("idle")
		fall(delta)
	
	body.move_and_slide()

func check_direction():
	if body.is_on_wall() or not plataform_detector.is_colliding() and body.is_on_floor():
		change_direction()

func change_direction():
	change_countdown = change_delay
	body.rotation = (body.rotation + PI)
	body.scale.y *= -1
	direction *= -1

func fall(delta):
	body.velocity = Vector2(0, min(body.velocity.y + gravity * delta, max_fall_speed))
