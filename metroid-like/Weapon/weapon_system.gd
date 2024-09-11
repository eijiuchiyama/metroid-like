extends Node

enum WeaponType {
	Gun, Missile, Bomb
}

var missileQty

func _ready() -> void:
	missileQty = 0
	GlobalSignals.missile_change.connect(_missile_change)
	GlobalSignals.missile_ui_update.emit(missileQty)

func _process(delta: float) -> void:
	pass

func _missile_change(value) -> void:
	missileQty = max(missileQty + value, 0)
	GlobalSignals.missile_ui_update.emit(missileQty)
