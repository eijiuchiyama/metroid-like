extends Node
class_name State

@onready
var state_manager : StateManager = self.get_parent()
@onready
var player_body : Player = self.get_parent().get_parent()
@onready 
var player_sprite : AnimatedSprite2D = player_body.get_node("PlayerSprite")
@onready
var weapon_manager : Marker2D = player_body.get_node("WeaponMarker")

func update_state() -> void:
	pass
	
func init_state() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fire_key") and player_body.is_human():
		weapon_manager.fire()
		
	if Input.is_action_just_pressed("switch_key"):
		weapon_manager.switch()
