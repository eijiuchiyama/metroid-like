extends Item

func collected() -> void:
	GlobalSignals.missile_change.emit(randi_range(1, 3))
