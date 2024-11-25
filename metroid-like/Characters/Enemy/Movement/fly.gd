extends Node
# This movement make a enemy fly randomly, but will stay close of initial position

var origin: Vector2
var body: Node
@export var max_dist: int = 30
@export var speed: int = 300
var move_timer : Timer

@export var sight_range: int = 500
@onready var player = get_tree().get_nodes_in_group("player")[0]

func _enter_tree() -> void:
	body = get_parent()
	origin = body.global_position

func _ready():
	move_timer = Timer.new()
	move_timer.one_shot = true
	add_child(move_timer)
	move_timer.connect("timeout", _on_move_timer_timeout)
	set_movement()

func move(delta: float) -> void:
	if player_in_range():
		if (player.global_position - body.global_position).x > 0:
			change_direction(0)
		else:
			change_direction(1)
	else:
		if body.velocity.x > 0:
			change_direction(0)
		elif body.velocity.x < 0:
			change_direction(1)
	body.move_and_slide()

func set_movement():
	var current_position =  body.global_position
	var dist_to_origin = current_position.distance_to(origin)
	var movement_angle = randf_range(-PI, PI) if dist_to_origin < max_dist else current_position.angle_to_point(origin)
	
	body.velocity = Vector2(cos(movement_angle), sin(movement_angle)) * speed
	
	move_timer.wait_time = randf_range(0.1, 0.2)
	move_timer.start()

func fall(delta):
	pass

func player_in_range() -> bool:
	var current_position = body.global_position
	var dist_to_player = current_position.distance_to(player.global_position)
	
	if dist_to_player < sight_range:
		return true
	
	return false

func change_direction(is_left):
	body.rotation = is_left * PI
	body.scale.y = -1 * abs(body.scale.y) if is_left else abs(body.scale.y)

func _on_move_timer_timeout():
	# Reset velocity to zero and wait for random time for next movement
	body.velocity = Vector2.ZERO
	await get_tree().create_timer(randf_range(.5, 1.5)).timeout
	set_movement()
