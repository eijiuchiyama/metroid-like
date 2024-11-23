extends Node

func _enter_tree() -> void:
	GlobalSignals.missile_ui_update.connect(_missile_ui_update)
	GlobalSignals.hp_ui_update.connect(_hp_ui_update)
	$Missile/MissileQty.text = str(0).pad_zeros(3)

func _process(delta: float) -> void:
	pass

func _missile_ui_update(value) -> void:
	$Missile/MissileQty.text = str(value).pad_zeros(3)

func _hp_ui_update(value) -> void:
	$EnergyLabel/Energy.text = str(value).pad_zeros(3)
