extends Weapon

const max_fall_speed: int = 1000
const gravity: int = 980

func _ready() -> void:
	$AnimatedSprite2D.play('default')
	$Timer.start()

func _process(delta: float) -> void:
	velocity = Vector2(0, min(velocity.y + gravity * delta, max_fall_speed))
	move_and_slide()

func fire(manager: Node, marker: Node, dir: Vector2) -> void:
	if PlayerStats.bombQty > 0:
		GlobalSignals.bomb_change.emit(-1)
		global_position = marker.global_position
		manager.get_tree().root.add_child(self)

func _on_timer_timeout() -> void:
	$Area2D/CollisionShape2D.disabled = false
	$AnimatedSprite2D.play('explosion')

func _on_animated_sprite_2d_animation_finished() -> void:
	var objects = $Area2D.get_overlapping_bodies()
	for object in objects:
		if "breakable" in object.get_groups():
			object.queue_free()
		if object is Enemy:
			object.life.subHp(damage)
	queue_free()	
