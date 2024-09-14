class_name Player extends Node

var horizontal_speed : int
var vertical_speed : int
enum mode {
	Human,
	Ball	
} 
var actual_mode : mode

func _ready() -> void:
	actual_mode = mode.Human
	vertical_speed = 1
	
func _process(delta: float) -> void:
	pass
	

func is_human() -> bool: 
	return actual_mode == mode.Human
