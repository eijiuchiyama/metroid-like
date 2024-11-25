extends Item

func collected() -> void:
	GlobalSignals.can_use_ball.emit(true)
