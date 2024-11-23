extends Weapon

func fire(manager: Node, marker: Node, dir: Vector2) -> void:
	if manager.missileQty > 0:
		GlobalSignals.missile_change.emit(-1)
		global_position = marker.global_position
		scale = Vector2(2, 2)
		direction = dir
		manager.get_tree().root.add_child(self)
		rotation = direction.angle()
