class_name Player extends CharacterBody2D

var horizontal_speed : int
var vertical_speed : int
enum mode {
	Human,
	Ball	
} 
var actual_mode : mode
var horizontal_direction : int

func _ready() -> void:
	actual_mode = mode.Human
	horizontal_speed = 500
	vertical_speed = 500
	
func _process(_delta: float) -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	self.velocity = input_direction * horizontal_speed
	move_and_slide()
	

func is_human() -> bool: 
	return actual_mode == mode.Human
	
