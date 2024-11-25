extends Item

func collected() -> void:
	GlobalSignals.can_use_bomb.emit(true)
