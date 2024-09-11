class_name Life extends Node2D

var hp
var hpMax
var is_visible : bool # visible é variavel reservado, não se pode usar

func Life(_hp, _hpMax, _visible) -> void: #não pode colocar var nos parametros, para definir tipo, use XXX : YYY
	pass

func getHp() -> int:
	return 0 #Só para eliminar erro
	pass
func getHpMax() -> int:
	return 0 #Só para eliminar erro
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
