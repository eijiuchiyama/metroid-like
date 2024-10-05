extends Node

@onready var attack_front_arm = get_node("AttackFront")
@onready var attack_fdown_arm = get_node("AttackFDown")
@onready var attack_fup_arm = get_node("AttackFUp")
@onready var jump_arm = get_node("Jump")
@onready var attack_up = get_node("AttackUp")

@onready var player_body = get_parent()

@export var actual_arm = attack_front_arm

var actual_marker

enum WeaponID{
	Gun, Missile, Bomb
}
var WeaponType = ["Gun", "Missile", "Bomb"]
var weaponIndex = WeaponID.Gun

var direction = Vector2(1, 0)
var missileQty = 0

func _ready() -> void:
	missileQty = 0
	GlobalSignals.missile_change.connect(_missile_change)
	GlobalSignals.missile_ui_update.emit(missileQty)
	actual_marker = actual_arm.get_node("Marker2D")
	
func _process(delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	direction = Vector2(sign(direction.x), sign(direction.y))
	if not player_body.is_on_floor():
		select_arm(jump_arm)
	elif direction.y == 0:
		select_arm(attack_front_arm)
	else:
		if direction.x == 0 and direction.y == -1:
			select_arm(attack_up)
		elif direction.y == 1:
			select_arm(attack_fdown_arm)
		elif direction.y == -1:
			select_arm(attack_fup_arm)

func fire() -> void:
	var weapons = {
		WeaponID.Gun: "res://Characters/Player/Weapon/Gun.tscn",
		WeaponID.Missile: "res://Characters/Player/Weapon/Missile.tscn"
	}
	
	var bullet = load(weapons[weaponIndex]).instantiate()
	var direction_x = 0 if actual_arm == attack_up else player_body.previous_direction
	bullet.fire(actual_marker, 10*Vector2(direction_x, direction.y))

func switch() -> void:
	weaponIndex = (weaponIndex + 1) % 2

func _missile_change(value) -> void:
	missileQty = max(missileQty + value, 0)
	GlobalSignals.missile_ui_update.emit(missileQty)
	
func select_arm(arm : Sprite2D):
	actual_arm.hide()
	actual_arm = arm
	actual_marker = actual_arm.get_node("Marker2D")
	actual_arm.show()
	
