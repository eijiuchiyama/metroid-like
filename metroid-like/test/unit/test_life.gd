extends GutTest

var Life = load("res://Life/life.gd")
var _life = null

func before_each():
	_life = Life.new(80, 100, false)

func after_each():
	_life.free()

func test_get_hp():
	assert_eq(_life.hp, 80, "A vida deve ser inicializada como 80")

func test_get_hp_max():
	assert_eq(_life.hpMax, 100, "A vida máxima deve ser inicializada como 100")

func test_set_hp():
	_life.setHp(95)
	assert_eq(_life.hp, 95, "A vida deve ser mudada para 95")

func test_hp_max():
	_life.setHpMax(200)
	assert_eq(_life.hpMax, 200, "A vida máxima deve ser mudada para 200")
	
func test_add_hp():
	_life.addHp(10)
	assert_eq(_life.hp, 90, "A vida deve ser mudada para 90")
	_life.addHp(500)
	assert_eq(_life.hp, _life.hpMax, "A vida não deve ultrapassar de hpMax")

func test_sub_hp():
	_life.subHp(10)
	assert_eq(_life.hp, 70, "A vida deve ser mudada para 70")
	_life.subHp(500)
	assert_eq(_life.hp, 0, "A vida não deve ser menor que 0")
	
