class_name Player extends CharacterBody2D

@onready var animation_manager = get_node("AnimationManager")
@onready var player_arm = get_node("PlayerArm")

var horizontal_speed : int
var vertical_speed : int
var gravity: int
enum mode {
	Human,
	Ball	
} 
var actual_mode : mode
var previous_direction : int

func _ready() -> void:
	previous_direction = 1
	actual_mode = mode.Human
	horizontal_speed = 500
	vertical_speed = 350
	gravity = 980
	
func _process(delta: float) -> void:
	var input_direction = Input.get_vector("left", "right", "jump", "down")
	self.velocity.x = input_direction.x * horizontal_speed
	if self.velocity.x != 0:
		previous_direction = sign(self.velocity.x)
	if not is_on_floor():
		self.velocity.y += gravity * delta
	else:
		self.velocity.y = 0
	if Input.is_action_just_pressed("jump") and is_on_floor():
		self.velocity.y -= vertical_speed
		
	player_arm.scale.x = previous_direction
	if previous_direction == -1:
		animation_manager.flip_animation(true)
	else:
		animation_manager.flip_animation(false)
		
	move_and_slide()
	

func is_human() -> bool: 
	return actual_mode == mode.Human
	
