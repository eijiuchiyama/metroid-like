extends Item

var hp_recovery:int = 10

func _ready() -> void:
	if randi_range(0, 1) == 0:
		$AnimatedSprite2D.play("big")
		hp_recovery = 20
	else:
		$AnimatedSprite2D.play("small")
		hp_recovery = 10

func collected() -> void:
	GlobalSignals.hp_change.emit(hp_recovery)
