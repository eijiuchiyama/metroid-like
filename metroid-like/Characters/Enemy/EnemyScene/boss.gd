extends Enemy
class_name Boss

var dead: bool = false

func _on_sprite_animation_finished() -> void:
	if Sprite.animation == "death" and dead == false:
		dead = true
		$AudioStreamPlayer2D.play()

func _on_audio_stream_player_2d_finished() -> void:
	get_tree().change_scene_to_file("res://Scenes/you_won_scene.tscn")
