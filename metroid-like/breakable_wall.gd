extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignals.hit_by_explosion.connect(_hit_by_explosion)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _hit_by_explosion():
	queue_free()
