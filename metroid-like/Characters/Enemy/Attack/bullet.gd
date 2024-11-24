extends CharacterBody2D

@onready var sprite = $Sprite
var direction = Vector2(0, 0)
var damage = 10
var speed = 1000

func fire(ray: RayCast2D) -> void:
	var player = ray.get_tree().get_nodes_in_group("player")[0]
	global_position = ray.global_position
	scale = Vector2(2, 2)
	direction = (player.global_position - ray.global_position).normalized()
	rotation = direction.angle()
	ray.get_tree().root.add_child(self)
	
func _process(delta: float) -> void:
	sprite.play("fire")
	velocity = direction * speed
	move_and_slide()
	
func _bullet_hit(body: Node2D) -> void:
	if body is Player:
		var knock_dir = (body.position - position).normalized()
		body.take_damage(knock_dir)
		GlobalSignals.hp_change.emit(-1 * damage)
	if body is not Enemy:
		queue_free()
