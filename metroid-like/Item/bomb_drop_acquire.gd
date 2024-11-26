extends Item

func collected() -> void:
	$AudioStreamPlayer2D.play()
	GlobalVariables.BombUnlocked = true
	GlobalSignals.bomb_unlock.emit()
