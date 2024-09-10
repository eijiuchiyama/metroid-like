class_name Life extends Node2D

var hp
var hpMax
bool visible

func Life(var _hp, var _hpMax, bool _visible) -> void:
	pass

func getHp() -> int:
	pass
func getHpMax() -> int:
	pass
func setHp() -> void:
	pass
func setHpMax() -> void:
	pass
func addHp() -> void:
	pass
func subHp() -> void:
	pass
func special() -> void: # Seria uma função virtual em C++ a ser implementada na subclasse que herdar Life (associada ao tipo de personagem que tem a vida
	pass
