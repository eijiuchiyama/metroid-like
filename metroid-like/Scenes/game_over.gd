extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _retry() -> void:
	GlobalVariables.reset()
	PlayerStats.reset()
	get_tree().change_scene_to_file("res://Scenes/map1reworked.tscn")


func _quit() -> void:
	get_tree().quit()
