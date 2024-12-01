extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if("player" in body.get_groups()):
		$AnimatedSprite2D.play("opening")

func _on_animated_sprite_2d_animation_finished() -> void:
	if($AnimatedSprite2D.animation == "opening"):
		$CollisionShape2D.disabled = true
		$Area2D2.queue_free()
		$AnimatedSprite2D.play("opened")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if("player" in body.get_groups()):
		get_tree().change_scene_to_file("res://Scenes/boss_room.tscn")
