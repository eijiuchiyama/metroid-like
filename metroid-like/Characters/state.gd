extends Node
class_name State

@onready
var state_manager : StateManager = self.get_parent()
@onready
var player_body : Node2D = self.get_parent().get_parent()
@onready
var weapon_manager : Marker2D = player_body.get_node("WeaponMarker")

func update_state() -> void:
	pass
	
func init_state() -> void:
	pass
