class_name CureFactor extends Life

var timer := Timer.new()

func _init() -> void:
	timer.wait_time = 30 # set wait_time for timer
	if not timer.is_connected("timeout", _on_timer_timeout):
		timer.connect("timeout", _on_timer_timeout)
# Called when the node enters the scene tree for the first time.

func cure():
	if hp < .2*hpMax:
		hp = hp + hpMax*.3
	elif hp < 0.3*hpMax:
		hp = hp + hpMax*.2
	else:
		hp = hp + hpMax*.1

func special():
	cure()
	return

func _on_timer_timeout():
	special()

func _ready() -> void:
	timer.start()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	

	
