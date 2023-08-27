extends Node2D

var menu
var new_game_button

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hi")
	menu = $Menu
	new_game_button = menu.get_node("new_game")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if(new_game_button.button_pressed == true):
		get_tree().change_scene_to_file("res://Scene/inside.tscn")
