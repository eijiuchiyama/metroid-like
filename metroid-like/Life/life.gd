class_name Life extends Node2D

var hp : int
var hpMax : int
var is_visible : bool # visible é variavel reservado, não se pode usar

func _init(_hp, _hpMax, _visible): #não pode colocar var nos parametros, para definir tipo, use XXX : YYY
	setHp(_hp)
	setHpMax(_hpMax)

func getHp() -> int:
	return hp
func getHpMax() -> int:
	return hpMax
func setHp(_hp) -> void:
	hp = _hp
	return
func setHpMax(_hpMax) -> void:
	hpMax = _hpMax
	return
func addHp(n) -> void:
	hp = hp + n
	return
func subHp(n) -> void:
	addHp(-n)
func special() -> void: # Seria uma função virtual em C++ a ser implementada na subclasse que herdar Life (associada ao tipo de personagem que tem a vida
	return # Se a subclasse não tiver um polimorfismo para esta função, a função apenas não faz nada
