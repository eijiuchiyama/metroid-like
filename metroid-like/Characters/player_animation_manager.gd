class_name AnimationManager extends Node

@export var ball_sprite : AnimatedSprite2D
@export var human_sprite : AnimatedSprite2D

var current_sprite : AnimatedSprite2D

func _enter_tree():
	current_sprite = human_sprite
	current_sprite.show()
	
func toggle_sprite(mode : String):
	if mode == "ball":
		ball_sprite.flip_h = current_sprite.flip_h
		current_sprite = ball_sprite
		ball_sprite.show()
		human_sprite.hide()
	elif mode == "human":
		human_sprite.flip_h = current_sprite.flip_h
		current_sprite = human_sprite
		ball_sprite.hide()
		human_sprite.show()

func toggle_animation(anim : String):
	current_sprite.play(anim)

func flip_animation(flip_val : bool):
	current_sprite.flip_h = flip_val
