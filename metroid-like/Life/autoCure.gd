extends Life
class_name autoCure

var timer := Timer.new()

func _init() -> void:
	timer.wait_time = 30 # set wait_time for timer
	timer.autostart = true
	if not timer.is_connected("timeout", _on_timer_timeout):
		timer.connect("timeout", _on_timer_timeout)

func _ready() -> void:
	GlobalSignals.hp_change.connect(_hp_change)
	GlobalSignals.hp_ui_update.emit(hp)

func cure():
	if hp < hpMax * .2:
		addHp(hpMax * .03)
	elif hp < hpMax * .3:
		addHp(hpMax * .02)
	else:
		addHp(hpMax * .01)

func special():
	cure()
	return

func _on_timer_timeout():
	special()

func _hp_change(value):
	if value > 0:
		addHp(value)
	else:
		subHp(abs(value))
	GlobalSignals.hp_ui_update.emit(hp)
