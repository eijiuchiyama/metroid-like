extends Node
class_name Life 

@export var hp : int = 70
@export var hpMax : int = 100

func getHp() -> int:
	return hp
func getHpMax() -> int:
	return hpMax

func setHp(healthPoints) -> void:
	hp = healthPoints
func setHpMax(maxHealthPoints) -> void:
	hpMax = maxHealthPoints

func addHp(n) -> void:
	hp = min(hp + n, hpMax)
func subHp(n) -> void:
	hp = max(hp - n, 0)
func special() -> void: # Seria uma função virtual em C++ a ser implementada na subclasse que herdar Life (associada ao tipo de personagem que tem a vida
	pass # Se a subclasse não tiver um polimorfismo para esta função, a função apenas não faz nada
