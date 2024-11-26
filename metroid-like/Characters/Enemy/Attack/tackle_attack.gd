extends Node

var body: Node
@onready var movement = get_parent().get_node("Movement")
@onready var player_detector = get_parent().get_node("Player_Detector")
@onready var player = get_tree().get_nodes_in_group("player")[0]

@export var attack_range:int = 200
@export var attack_delay = .5
var attack_countdown = 0

const max_fall_speed: int = 1000
const gravity: int = 980

@export var speed: int = 500
var attack_wait_duration = 2
var attack_current_wait_duration = 0
var attack_duration = .5
var attack_current_duration = 0
var attack_direction : Vector2

func _enter_tree() -> void:
	body = get_parent()

func tryAttack(delta: float):
	if body.in_attack:
		tackleAttack(delta)
		return
	
	attack_countdown = max(attack_countdown - delta, 0)	
		
	if player_in_range():
		if attack_countdown == 0:
			body.in_attack = true
			attack_countdown = attack_delay
			attack_current_duration = 0
			attack_current_wait_duration = 0

func tackleAttack(delta):
	if attack_current_wait_duration < attack_wait_duration:
		attack_direction = (player.global_position - player_detector.global_position).normalized()
		attack_current_wait_duration += delta
		movement.fall(delta)
	elif attack_current_duration < attack_duration:
		attack_current_duration += delta
		body.velocity = attack_direction * speed
	else:
		body.in_attack = false
	body.move_and_slide()

func player_in_range() -> bool:
	var current_position = player_detector.global_position
	var dist_to_player = current_position.distance_to(player.global_position)
	
	if dist_to_player < attack_range:
		player_detector.target_position = (player.global_position - player_detector.global_position) / 2
		player_detector.target_position.x *= sign(body.scale.y)
		
		if player_detector.get_collider() is Player:
			return true
	
	return false
