extends Item

func collected() -> void:
	GlobalSignals.damage.emit(100)
