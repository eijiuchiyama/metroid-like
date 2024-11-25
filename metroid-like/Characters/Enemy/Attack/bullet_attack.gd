extends Node

var body: Node
var bullet_path = "res://Characters/Enemy/Attack/Bullet.tscn"
@onready var player_detector = get_parent().get_node("Player_Detector")
@onready var player = get_tree().get_nodes_in_group("player")[0]

@export var attack_range:int = 200
@export var attack_delay = .5
var attack_countdown = 0

func _enter_tree() -> void:
	body = get_parent()

func tryAttack(delta: float):
	attack_countdown = max(attack_countdown - delta, 0)
	body.in_attack = false
	
	if player_in_range():
		body.in_attack = true
		if attack_countdown == 0:
			attack_countdown = attack_delay
			var bullet = load(bullet_path).instantiate()
			bullet.fire(player_detector)

func player_in_range() -> bool:
	var current_position = player_detector.global_position
	var dist_to_player = current_position.distance_to(player.global_position)
	
	if dist_to_player < attack_range:
		player_detector.target_position = (player.global_position - player_detector.global_position) / 2
		player_detector.target_position.x *= sign(body.scale.y)
		
		if player_detector.get_collider() is Player:
			return true
	
	return false
