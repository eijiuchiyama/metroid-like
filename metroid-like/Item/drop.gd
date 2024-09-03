class_name Item extends Node2D

func _ready() -> void:
	$AnimatedSprite2D.play("default")

func collected() -> void:
	# Override
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	#if body == Player:
	if true:
		collected()
		queue_free()
