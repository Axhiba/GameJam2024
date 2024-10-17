extends Node2D

signal attackFinished
signal battleWon

var numberOfEnemies = 0
var attacking = false
var moveTowardPath = false
var currentEnemy
var originalPosition
# Called when the node enters the scene tree for the first time.
func _ready():
	currentEnemy = $Enemy
	originalPosition = currentEnemy.global_position
	numberOfEnemies = get_child_count()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if numberOfEnemies <= 0:
		battleWon.emit("All enemies defeated...")
	
	var attackPath = $BakeBakeAttackPath1
	var attackPathFollow = $BakeBakeAttackPath1/PathFollow2D
	
	var attackCurve = attackPath.get_curve()
	var attackPoints = attackCurve.get_baked_points()
	
	const SPEED = 200
	#var destination = to_global(attackPoints[0])
	var destination = attackPath.to_global(attackCurve.get_point_position(0))
	#var destination = attackCurve.get_point_position(0)
	print(destination)
	
	#enemy.position += enemy.position.direction_to(destination) * SPEED * delta
	if currentEnemy.global_position.distance_to(destination) <= 2:
		moveTowardPath = false
		attacking = true
		currentEnemy.reparent(attackPathFollow, true)
	
	if moveTowardPath:
		currentEnemy.global_position += currentEnemy.global_position.direction_to(destination) * SPEED * delta
	elif attacking:
		attackPathFollow.progress_ratio  += delta * 1.0
		if attackPathFollow.progress_ratio  >= 0.95:
			attacking = false
			currentEnemy.reparent(get_owner(),true)
			currentEnemy.global_position = originalPosition
			attackFinished.emit()
		
		
func enemyTurn():
	#TODO: iterate through enemies, control through states
	moveTowardPath = true 
	
	#for _enemies in self.get_children():
	#	_enemies.attack()
	

func _on_enemy_death():
	numberOfEnemies -= 1
	pass # Replace with function body.
