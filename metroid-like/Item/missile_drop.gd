extends Item

func collected() -> void:
	GlobalSignals.missile_change.emit(2)
