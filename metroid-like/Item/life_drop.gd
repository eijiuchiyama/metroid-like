extends Item

func _ready() -> void:
	if randi_range(0, 1) == 0:
		$AnimatedSprite2D.play("big")
	else:
		$AnimatedSprite2D.play("small")

func collected() -> void:
	# Recupera Vida
	pass
