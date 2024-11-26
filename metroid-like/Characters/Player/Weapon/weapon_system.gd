extends Node

@onready var attack_front_arm = get_node("AttackFront")
@onready var attack_fdown_arm = get_node("AttackFDown")
@onready var attack_fup_arm = get_node("AttackFUp")
@onready var jump_arm = get_node("Jump")
@onready var attack_up = get_node("AttackUp")

var player_body = get_parent()

@export var current_arm = attack_front_arm
@onready var ui : CanvasLayer = get_parent().ui

var current_marker

var ignore_first_switch_call: bool = true

enum WeaponID{
	Gun, Missile, Bomb, Null
}
var WeaponType = ["Gun", "Missile", "Bomb", "Null"]
var weaponIndex = WeaponID.Gun
var AttackDelay = 0.2
var attackCountdown = 0

var direction = Vector2(1, 0)

func _enter_tree() -> void:
	player_body = get_parent()

func _ready() -> void:
	attackCountdown = 0
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
		WeaponID.Missile: "res://Characters/Player/Weapon/Missile.tscn",
		WeaponID.Bomb: "res://Characters/Player/Weapon/Bomb.tscn"
	}
	
	if attackCountdown > 0:
		return
	else:
		attackCountdown = AttackDelay
	
	if weaponIndex == WeaponID.Bomb:
		var bomb = load(weapons[WeaponID.Bomb]).instantiate()
		bomb.position = current_marker.global_position   
		get_tree().root.add_child(bomb)
	else:
		var bullet = load(weapons[weaponIndex]).instantiate()
		var direction_x = 0 if current_arm == attack_up else player_body.previous_direction
		bullet.fire(self, current_marker, 10*Vector2(direction_x, direction.y))

func switch_weapon() -> void:
	if ignore_first_switch_call:
		# When init HumanState at begining of game it calls tis method, who
		# access the method is_human(), but at this point, AnimationManager
		# Was not been load yet, so the game crashes - Technical Debt
		ignore_first_switch_call = false
		return
	if player_body.is_human():
		if weaponIndex > 1: # Return to Gun if change state from Morph to Human
			weaponIndex = WeaponID.Gun
		elif GlobalVariables.MissileUnlocked:
			weaponIndex = (weaponIndex + 1) % 2
		else:
			weaponIndex = WeaponID.Gun
	else:
		if GlobalVariables.BombUnlocked:
			weaponIndex = WeaponID.Bomb
		else:
			weaponIndex = WeaponID.Null
	ui.toggle_icon(WeaponType[weaponIndex])

func select_arm(arm : Sprite2D):
	current_arm.hide()
	current_arm = arm
	current_marker = current_arm.get_node("Marker2D")
	current_arm.show()
	
