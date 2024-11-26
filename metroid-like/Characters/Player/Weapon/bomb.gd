extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play('default')
	$Timer.start()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	$AnimatedSprite2D.play('explosion')
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished() -> void:
	$Area2D/CollisionShape2D.disabled = false
	$Timer2.start()
	pass # Replace with function body.


func _on_area_2d_area_entered(area: Area2D) -> void:
	GlobalSignals.hit_by_explosion.emit()
	pass # Replace with function body.


func _on_timer_2_timeout() -> void:
	queue_free()
	pass # Replace with function body.
