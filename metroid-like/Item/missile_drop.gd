extends Item

signal MissileCollected

func collected() -> void:
	GlobalSignals.missile_change.emit(2)
