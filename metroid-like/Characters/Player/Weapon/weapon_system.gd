extends Node

@onready var attack_front_arm = get_node("AttackFront")
@onready var attack_fdown_arm = get_node("AttackFDown")
@onready var attack_fup_arm = get_node("AttackFUp")
@onready var jump_arm = get_node("Jump")
@onready var attack_up = get_node("AttackUp")

@onready var player_body = get_parent()

@export var current_arm = attack_front_arm
@onready var ui : CanvasLayer = get_parent().ui

var current_marker

enum WeaponID{
	Gun, Missile, Bomb
}
var WeaponType = ["Gun", "Missile", "Bomb"]
var weaponIndex = WeaponID.Gun
var AttackDelay = 0.2
var attackCountdown = 0

var direction = Vector2(1, 0)
var missileQty = 0
var bombQty = 0

func _ready() -> void:
	attackCountdown = 0
	missileQty = 0
	bombQty = 0
	GlobalSignals.missile_change.connect(_missile_change)
	GlobalSignals.missile_ui_update.emit(missileQty)
	current_marker = current_arm.get_node("Marker2D")
	
func _process(delta: float) -> void:
	attackCountdown = max(attackCountdown - delta, 0)
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
	
	if attackCountdown > 0:
		return
	else:
		attackCountdown = AttackDelay
	
	var bullet = load(weapons[weaponIndex]).instantiate()
	var direction_x = 0 if current_arm == attack_up else player_body.previous_direction
	bullet.fire(self, current_marker, 10*Vector2(direction_x, direction.y))

func switch() -> void:
	weaponIndex = (weaponIndex + 1) % 2
	ui.toggle_icon(WeaponType[weaponIndex])

func _missile_change(value) -> void:
	missileQty = max(missileQty + value, 0)
	GlobalSignals.missile_ui_update.emit(missileQty)
	
func _bomb_change(value) -> void:
	bombQty = max(bombQty + value, 0)
	print(value)
	GlobalSignals.bomb_ui_update.emit(bombQty)
	
func select_arm(arm : Sprite2D):
	current_arm.hide()
	current_arm = arm
	current_marker = current_arm.get_node("Marker2D")
	current_arm.show()
	
