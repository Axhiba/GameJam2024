extends Node

class_name TurnQueue

var active_character

# Called when the node enters the scene tree for the first time.
func _ready():
	active_character = get_child(0)
	play_turn()

func play_turn():
	await active_character.play_turn()
	var new_index : int = (active_character.get_index() + 1) % get_child_count()
	active_character = get_child(new_index)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
