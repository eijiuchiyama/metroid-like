extends Item

func collected() -> void:
	GlobalVariables.MorphBallUnlocked = true
	GlobalSignals.ball_unlock.emit()
