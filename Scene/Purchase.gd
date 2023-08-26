extends Button

@export var player_name = "Character"
var player
# wonder what this is for? in the main scene, this goes to the very very top node! one node down, there should
# be the character and the spawners
@onready var absolute_parent = get_parent().get_parent()
# Used to increase the score (Spawners should be the child of a "scene" node)
@export var score_value = 1

func _ready():
	if absolute_parent.get_node_or_null(player_name) != null:
		player = absolute_parent.get_node(player_name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _pressed():
	print("Hai")
	player.fire_rate /= 4
