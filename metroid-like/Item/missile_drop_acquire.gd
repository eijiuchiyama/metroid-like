extends Item

func collected() -> void:
	GlobalSignals.can_use_missile.emit(true)
