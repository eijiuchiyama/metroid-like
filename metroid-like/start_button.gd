extends Button

var main_scene = load("res://Scenes/test_scene.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(get_tree())
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	get_tree().change_scene_to(main_scene)
	#pass # Replace with function body.
