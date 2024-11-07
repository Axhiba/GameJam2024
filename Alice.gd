extends Node2D
var throwAreaScene = preload("res://throw_area.tscn")

@export var maxHealth = 20
@export var currentHealth = maxHealth
signal endAliceTurn

# Called when the node enters the scene tree for the first time.
func _ready():
	updateHealthUI()
	$Hurtbox.damage_taken.connect(on_damage_taken)

func on_damage_taken(damage):
	print('alice damaged by',damage)
	currentHealth -= damage
	updateHealthUI()

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
	throwarea.dollThrown.connect(_on_doll_thrown)
	#await the doll attacks?

func _on_doll_thrown():
	$AnimatedSprite2D.play("throw") #todo: use animationPlayer instead
	
func dollAttacks():
	var dolls = $DollProjectile
	
func endMove2():
	var throwarea = get_node("ThrowArea")
	remove_child(throwarea)
	$AnimatedSprite2D.play("idle")

func _on_doll_placement_spots_turn_completed():
	endMove1()
	endAliceTurn.emit()

func blowUpDolls(num):
	var CollisionArray = get_node("DollPlacementSpots")
	CollisionArray.blowDollsUp(num)

func move1Cleanup():
	var CollisionArray = get_node("DollPlacementSpots")
	CollisionArray.cleanup()

