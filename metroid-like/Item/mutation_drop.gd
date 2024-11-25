extends Item

func collected() -> void:
	GlobalSignals.change_mutation.emit(100)
