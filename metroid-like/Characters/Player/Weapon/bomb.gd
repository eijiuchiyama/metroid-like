extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play('default')
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	$Area2D/CollisionShape2D.disabled = false
	$AnimatedSprite2D.play('explosion')


func _on_animated_sprite_2d_animation_finished() -> void:
	var objetos = $Area2D.get_overlapping_bodies()
	for objeto in objetos:
		if "breakable" in objeto.get_groups():
			objeto.queue_free()
	queue_free()
