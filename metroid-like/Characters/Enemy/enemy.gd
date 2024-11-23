extends CharacterBody2D
class_name Enemy

@onready var movement = $Movement
@onready var attack = $Attack
@onready var hitBox = $HitArea
@onready var life = $Life
@export var collision_damage: int

func _process(delta: float) -> void:
	movement.move(delta)
	attack.tryAttack()

func _on_hit_area_body_entered(body: Node2D) -> void:
	if body is Player:
		GlobalSignals.hp_change.emit(-1 * collision_damage)
	if body is Weapon:
		life.subHp(body.damage)
		if life.hp == 0:
			death()
		body.queue_free()

func death():
	print("Dead")
	queue_free()
