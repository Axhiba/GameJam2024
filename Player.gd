extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Copy Pasta!
func startMove1():
	var marisa = get_node("Marisa")
	var alice = get_node("Alice")
	alice.startMove1()
	pass


func startMove2():
	var alice = get_node("Alice")
	alice.startMove2()
	pass


func _on_attack_2_button_pressed():
	startMove2()
	
func _on_attack_1_button_pressed():
	startMove1()


func _on_alice_end_alice_turn():
	var marisa = get_node("Marisa")
	marisa.startMove1()
	pass # Replace with function body.
