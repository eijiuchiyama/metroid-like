class_name AnimationManager extends Node

@export var ball_sprite : AnimatedSprite2D
@export var human_sprite : AnimatedSprite2D

@export var current_sprite : AnimatedSprite2D

func _ready():
	current_sprite.show()
	
func toggle_sprite(mode : String):
	if mode == "ball":
		current_sprite = ball_sprite
		ball_sprite.show()
		human_sprite.hide()
	elif mode == "human":
		current_sprite = human_sprite
		ball_sprite.hide()
		human_sprite.show()

func toggle_animation(anim : String):
	human_sprite.play(anim)
	ball_sprite.play(anim)

func flip_animation(flip_val : bool):
	current_sprite.flip_h = flip_val
