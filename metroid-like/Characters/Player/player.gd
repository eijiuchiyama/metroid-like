class_name Player extends Node

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
	self.velocity.y = 100
	
func _process(delta: float) -> void:
	pass
	

func is_human() -> bool: 
	return actual_mode == mode.Human
