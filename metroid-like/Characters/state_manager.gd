extends Node
class_name StateManager

@export
var current_state : State

func _ready() -> void:
	current_state.init_state()
	
func _process(delta: float) -> void:
	current_state.update_state()

func switch_state(new_state : State) -> void:
	current_state = new_state
	current_state.init_state()
