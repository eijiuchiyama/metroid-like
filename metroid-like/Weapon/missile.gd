extends Weapon

func _ready() -> void:
	GlobalSignals.missile_change.emit(-1)

func fire(manager: Node) -> void:
	if manager.missileQty > 0:
		global_position = manager.global_position
		scale = Vector2(2, 2)
		direction = manager.direction
		manager.get_tree().root.add_child(self)
