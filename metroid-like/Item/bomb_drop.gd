extends Item

func collected() -> void:
	GlobalSignals.bomb_change.emit(10)
