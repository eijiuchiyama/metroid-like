class_name Life extends Node
var hp : int
var hpMax : int
var is_visible : bool # visible é variavel reservado, não se pode usar

func _init(healthPoints : int, maxHealthPoints :int, Visible : bool): #não pode colocar var nos parametros, para definir tipo, use XXX : YYY
	setHp(healthPoints)
	setHpMax(maxHealthPoints)

func getHp() -> int:
	return hp
func getHpMax() -> int:
	return hpMax
func setHp(healthPoints) -> void:
	hp = healthPoints
	return
func setHpMax(maxHealthPoints) -> void:
	hpMax = maxHealthPoints
	return
func addHp(n) -> void:
	if not hp + n < hpMax:
		hp = hp + n
	else:
		hp = hpMax
	return
func subHp(n) -> void:
	if not hp - n < 0:
		addHp(-n)
	return
	hp = 0
	return
func special() -> void: # Seria uma função virtual em C++ a ser implementada na subclasse que herdar Life (associada ao tipo de personagem que tem a vida
	pass # Se a subclasse não tiver um polimorfismo para esta função, a função apenas não faz nada
