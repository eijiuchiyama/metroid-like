extends Item

func collected() -> void:
	GlobalSignals.ball_unlock.emit()
