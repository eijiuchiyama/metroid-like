class_name Player extends CharacterBody2D

@onready var animation_manager = get_node("AnimationManager")
@onready var player_arm = get_node("PlayerArm")

enum mode {
	Human,
	Ball,
} 

var horizontal_speed : int = 500
var jump_force : int = -350
var gravity: int = 980
var current_mode : mode = mode.Human
var previous_direction : int = 1
	
func _process(delta: float) -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	self.velocity.x = input_direction.x * horizontal_speed
	if self.velocity.x != 0:
		previous_direction = sign(self.velocity.x)
	
	self.velocity.y = self.velocity.y + gravity * delta if not is_on_floor() else 0
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		self.velocity.y = jump_force
		
	player_arm.scale.x = previous_direction
	if previous_direction == -1:
		animation_manager.flip_animation(true)
	else:
		animation_manager.flip_animation(false)
		
	move_and_slide()
	

func is_human() -> bool: 
	return current_mode == mode.Human
	
