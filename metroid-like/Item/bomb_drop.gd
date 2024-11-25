extends Item

func collected() -> void:
	GlobalSignals.bomb_change.emit(randi_range(1,3))
