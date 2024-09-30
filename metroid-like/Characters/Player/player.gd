class_name Player extends CharacterBody2D

var horizontal_speed : int
var vertical_speed : int
var gravity: int
enum mode {
	Human,
	Ball	
} 
var actual_mode : mode
var horizontal_direction : int

func _ready() -> void:
	actual_mode = mode.Human
	horizontal_speed = 500
	vertical_speed = 350
	gravity = 980
	
func _process(delta: float) -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	self.velocity.x = input_direction.x * horizontal_speed
	if not is_on_floor():
		self.velocity.y += gravity * delta
	else:
		self.velocity.y = 0
	if Input.is_action_just_pressed("jump") and is_on_floor():
		self.velocity.y -= vertical_speed
	move_and_slide()
	

func is_human() -> bool: 
	return actual_mode == mode.Human
	
