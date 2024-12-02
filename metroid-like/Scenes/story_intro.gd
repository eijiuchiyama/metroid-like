extends Node2D

var texts = ["No final do 3º milênio, desenvolvemos fusão nuclear para termos energia a baixo custo.  Era de Harmonia e Paz...",
"Também desenvolvemos máquinas que nos permitem acelerar nossa mutação...",
"Porém, uma invasão de alienígenas com capacidade de mutação mais desenvolvida ameaça nossa civilização...",
"Nossa melhor guerreira com trajes alienígenas modificados é a última esperança para derrotar os invasores e reconstruir a civilização a partir dos remanescentes que habitam o submundo."]

var index: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	index = 0
	$TextEdit.text = texts[index]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_texture_button_pressed() -> void:
	index = index + 1
	if(index < texts.size()):
		$TextEdit.text = texts[index]
	else:
		get_tree().change_scene_to_file("res://Scenes/map1reworked.tscn")
