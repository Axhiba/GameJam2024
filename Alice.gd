extends Node2D
var throwAreaScene = preload("res://throw_area.tscn")

@export var maxHealth = 20
@export var currentHealth = maxHealth
signal endAliceTurn

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func updateHealthUI():
	BattleEvent.playerHealthUpdated.emit(currentHealth, maxHealth, "Alice")
	
func startMove1():
	var CollisionArray = get_node("DollPlacementSpots")
	for M in CollisionArray.get_children():
		M.activate()

func endMove1():
	var CollisionArray = get_node("DollPlacementSpots")
	for M in CollisionArray.get_children():
		M.disable()

func startMove2():
	var throwarea = throwAreaScene.instantiate()
	add_child(throwarea)
	#await the doll attacks?

func dollAttacks():
	var dolls = $DollProjectile
	
func endMove2():
	var throwarea = get_node("ThrowArea")
	remove_child(throwarea)

func _on_doll_placement_spots_turn_completed():
	endMove1()
	endAliceTurn.emit()

func blowUpDolls(num):
	var CollisionArray = get_node("DollPlacementSpots")
	CollisionArray.blowDollsUp(num)

func move1Cleanup():
	var CollisionArray = get_node("DollPlacementSpots")
	CollisionArray.cleanup()
