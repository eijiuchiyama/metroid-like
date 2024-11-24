extends Node

var body: Node
@onready var movement = get_parent().get_node("Movement")
@onready var player_detector = get_parent().get_node("Player_Detector")
@onready var player = get_tree().get_nodes_in_group("player")[0]
var bullet_path = "res://Characters/Enemy/Attack/Bullet.tscn"

@export var atack_range:int = 20
@export var attack_delay = .5
var attack_countdown = 0

func _enter_tree() -> void:
	body = get_parent()

func tryAttack(delta: float):
	attack_countdown = max(attack_countdown - delta, 0)
	body.in_attack = false
	
	var current_position = player_detector.global_position
	var dist_to_player = current_position.distance_to(player.global_position)
	
	if dist_to_player < atack_range:
		player_detector.target_position = (player.global_position - player_detector.global_position) / 2
		player_detector.target_position.x *= sign(body.scale.y)
		
		if player_detector.get_collider() is Player:
			body.in_attack = true
			if attack_countdown == 0:
				attack_countdown = attack_delay
				var bullet = load(bullet_path).instantiate()
				bullet.fire(player_detector)
