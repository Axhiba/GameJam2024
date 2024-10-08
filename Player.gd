extends Node2D

var marisa
var alice

signal attackFinished

# Called when the node enters the scene tree for the first time.
func _ready():
	marisa = $"Marisa"
	alice = $"Alice"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Copy Pasta!
func startMove1():
	#marisa.startMove1()
	alice.startMove1()

func startMove2():
	marisa.startMove2()
	alice.startMove2()
	BattleEvent.move2Ended.connect(_on_move2_End)

func endMove1():
	alice.move1Cleanup()
	attackFinished.emit()

func _on_move2_End():
	marisa.endMove2()
	alice.endMove2()
	BattleEvent.move2Ended.disconnect(_on_move2_End)
	attackFinished.emit()

func _on_attack_2_button_pressed():
	startMove2()
	
func _on_attack_1_button_pressed():
	startMove1()

func _on_alice_end_alice_turn():
	marisa.startMove1()
	pass # Replace with function body.

func _on_marisa_initiate_explosions():
	var count = marisa.get_Successes()
	alice.blowUpDolls(count)
	endMove1()
	
