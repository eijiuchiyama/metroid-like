extends Item

func collected() -> void:
	GlobalVariables.BombUnlocked = true
	GlobalSignals.bomb_unlock.emit()
