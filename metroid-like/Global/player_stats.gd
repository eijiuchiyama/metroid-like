extends Node

@onready var life = get_node("LifeComponent")

var missileQty = 0
var bombQty = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	missileQty = 0
	bombQty = 0
	GlobalSignals.missile_change.connect(_missile_change)
	GlobalSignals.bomb_change.connect(_bomb_change)
	GlobalSignals.missile_ui_update.emit(missileQty)
	GlobalSignals.bomb_ui_update.emit(bombQty)

func _missile_change(value) -> void:
	missileQty = max(missileQty + value, 0)
	GlobalSignals.missile_ui_update.emit(missileQty)
	
func _bomb_change(value) -> void:
	bombQty = max(bombQty + value, 0)
	print(value)
	GlobalSignals.bomb_ui_update.emit(bombQty)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
