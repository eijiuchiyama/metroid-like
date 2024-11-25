extends Node

func _enter_tree() -> void:
	GlobalSignals.missile_ui_update.connect(_missile_ui_update)
	GlobalSignals.hp_ui_update.connect(_hp_ui_update)
	$Missile/MissileQty.text = str(0).pad_zeros(3)
	$Bomb/BombQty.text = str(0).pad_zeros(3)

func _process(delta: float) -> void:
	pass
	
func _bomb_ui_update(value) -> void:
	$Bomb/BombQty.text = str(value).pad_zeros(3)

func _missile_ui_update(value) -> void:
	$Missile/MissileQty.text = str(value).pad_zeros(3)

func _hp_ui_update(value) -> void:
	$EnergyLabel/Energy.text = str(value).pad_zeros(3)

func toggle_icon(icon):
	$Bullet.modulate = Color.WHITE
	$Bomb.modulate = Color.WHITE
	$Missile.modulate = Color.WHITE
	match icon:
		"Missile":
			$Missile.modulate = Color.GREEN
		"Bullet":
			$Bullet.modulate = Color.GREEN
		"Bomb":
			$Bomb.modulate = Color.GREEN
		"Null":
			pass
