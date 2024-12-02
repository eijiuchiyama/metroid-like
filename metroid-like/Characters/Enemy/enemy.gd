extends CharacterBody2D
class_name Enemy

@onready var movement = $Movement
@onready var attack = $Attack
@onready var hitBox = $HitArea
@onready var life = $Life
@onready var Sprite = $Sprite
@export var collision_damage: int

var in_attack: bool = false

func _process(delta: float) -> void:
	if life.hp > 0:
		if not in_attack:
			movement.move(delta)
		attack.tryAttack(delta)
	else:
		death()

func _on_hit_area_body_entered(body: Node2D) -> void:
	if body is Player:
		var knock_dir = (body.position - position).normalized()
		body.take_damage(knock_dir)
		GlobalSignals.hp_change.emit(-1 * collision_damage)

func death():
	Sprite.scale = Vector2(2, 2)
	Sprite.play("death")

func _on_sprite_animation_finished() -> void:
	if Sprite.animation == "death":
		queue_free()
