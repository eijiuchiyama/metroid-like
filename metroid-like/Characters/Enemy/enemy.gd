extends CharacterBody2D
class_name Enemy

@onready var Movement = $Movement
@onready var Attack = $Attack
@onready var HitBox = $HitArea
@export var collision_damage: int

func _process(delta: float) -> void:
	Movement.move(delta)
	Attack.tryAttack()

func _on_hit_area_body_entered(body: Node2D) -> void:
	if body is Player:
		# Hit Player
		pass
