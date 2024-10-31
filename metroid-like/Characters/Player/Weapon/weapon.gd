class_name Weapon extends Area2D

var direction = Vector2(0, 0)

func fire(manager: Node, marker: Node, dir: Vector2) -> void:
	global_position = marker.global_position
	scale = Vector2(2, 2)
	direction = dir
	manager.get_tree().root.add_child(self)

func _process(delta: float) -> void:
	global_position += 3 * direction
	pass
