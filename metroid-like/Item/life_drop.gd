extends Item

var hp_recovery: int

func _ready() -> void:
	if randi_range(0, 1) == 0:
		$AnimatedSprite2D.play("big")
		hp_recovery = 30
	else:
		$AnimatedSprite2D.play("small")
		hp_recovery = 15

func collected() -> void:
	GlobalSignals.hp_change.emit(hp_recovery)
