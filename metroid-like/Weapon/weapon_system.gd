extends Marker2D

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

func fire() -> void:
	var weapons = {
		WeaponID.Gun: "res://Weapon/Gun.tscn",
		WeaponID.Missile: "res://Weapon/Missile.tscn"
	}
	
	var bullet = load(weapons[weaponIndex]).instantiate()
	bullet.fire(self)

func switch() -> void:
	weaponIndex = (weaponIndex + 1) % 2

func _missile_change(value) -> void:
	missileQty = max(missileQty + value, 0)
	GlobalSignals.missile_ui_update.emit(missileQty)
