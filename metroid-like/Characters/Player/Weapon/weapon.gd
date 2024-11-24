extends CharacterBody2D
class_name Weapon

var direction = Vector2(0, 0)
var damage = 10
var speed = 100

func fire(manager: Node, marker: Node, dir: Vector2) -> void:
	global_position = marker.global_position
	scale = Vector2(2, 2)
	direction = dir
	manager.get_tree().root.add_child(self)
	rotation = direction.angle()
	
func _process(delta: float) -> void:
	velocity = direction * speed
	move_and_slide()
	
func _bullet_hit(body: Node2D) -> void:
	if body is Enemy:
		body.life.subHp(damage)
	if body is not Player:
		queue_free()
