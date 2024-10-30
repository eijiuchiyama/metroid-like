extends GutTest

var Weapon = load("res://Characters/Player/Weapon/weapon_system.gd")
var _weapon = null

func before_each():
	_weapon = Weapon.new()

func after_each():
	_weapon.free()

func test_weapon_switch():
	assert_eq(_weapon.weaponIndex, _weapon.WeaponID.Gun, "Arma deve ser inicializada como Arma Normal")
	_weapon.switch()
	assert_eq(_weapon.weaponIndex, _weapon.WeaponID.Missile, "Arma segundária deve ser Míssil")
	_weapon.switch()
	assert_eq(_weapon.weaponIndex, _weapon.WeaponID.Gun, "Arma após duas troca deve voltar ao Arma Normal")

func test_missile_change():
	assert_eq(_weapon.missileQty, 0, "A quantidade de Missil deve ser inicializada ao 0")
	_weapon._missile_change(10)
	assert_eq(_weapon.missileQty, 10, "A quantidade de Missil deve ser 10")
	_weapon._missile_change(-5)
	assert_eq(_weapon.missileQty, 5, "A quantidade de Missil deve ser 5")
	_weapon._missile_change(-20)
	assert_eq(_weapon.missileQty, 0, "A quantidade de Missil deve ser no mínimo 0")
	
