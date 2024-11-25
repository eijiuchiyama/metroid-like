extends Node
class_name State

@onready
var state_manager : StateManager = self.get_parent()
@onready
var player_body : Player = self.get_parent().get_parent()
@onready 
var animation_manager : Node = player_body.get_node("AnimationManager")
@onready
var player_arm : Node2D = player_body.get_node("PlayerArm")

func update_state() -> void:
	pass
	
func init_state() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fire_key") and player_body.is_human():
		player_arm.fire()
		
	if Input.is_action_just_pressed("switch_key"):
		player_arm.switch_weapon()
