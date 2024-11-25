extends Item

func collected() -> void:
	GlobalVariables.MissileUnlocked = true
	GlobalSignals.missile_unlock.emit()
