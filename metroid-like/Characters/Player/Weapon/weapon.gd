class_name Weapon extends Area2D

var direction = Vector2(0, 0)

func fire(manager: Node, dir) -> void:
	global_position = manager.global_position
	scale = Vector2(2, 2)
	direction = dir
	manager.get_tree().root.add_child(self)

func _process(delta: float) -> void:
	global_position += 3 * direction
	pass
