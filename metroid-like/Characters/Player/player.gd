extends CharacterBody2D
class_name Player

@onready var animation_manager = get_node("AnimationManager")
@onready var player_arm = get_node("PlayerArm")
@onready var collision_human = get_node("CollisionShapeHuman")
@onready var collision_ball = get_node("CollisionShapeBall")

@export var ui : CanvasLayer

const horizontal_speed : int = 500
const jump_force : int = -900
const max_fall_speed: int = 1000
const gravity: int = 980

var previous_direction : int = 1
var is_damaged = false

func _process(delta: float) -> void:
	if not is_damaged:
		var input_direction = Input.get_vector("left", "right", "up", "down")
		self.velocity.x = input_direction.x * horizontal_speed
		
		if self.velocity.x != 0:
			previous_direction = sign(self.velocity.x)
		
		self.velocity.y = min(self.velocity.y + gravity * delta, max_fall_speed) if not is_on_floor() else 0
		
		if Input.is_action_just_pressed("jump") and is_on_floor():
			self.velocity.y = jump_force
		
		player_arm.scale.x = previous_direction
		if previous_direction == -1:
			animation_manager.flip_animation(true)
		else:
			animation_manager.flip_animation(false)
	
	if not is_on_floor():
		self.velocity.y = min(self.velocity.y + gravity * delta, max_fall_speed)
	move_and_slide()

func is_human() -> bool: 
	return animation_manager.current_sprite == animation_manager.human_sprite
	
func take_damage(knock_dir):
	is_damaged = true
	velocity = knock_dir*900
	await get_tree().create_timer(0.2).timeout
	is_damaged = false
	pass
