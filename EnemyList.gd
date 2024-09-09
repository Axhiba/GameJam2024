extends Node2D

signal attackFinished

var numberOfEnemies = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	numberOfEnemies = get_child_count()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func enemyTurn():
	for _enemies in self.get_children():
		_enemies.attack()
	attackFinished.emit()

func _on_enemy_death():
	numberOfEnemies -= 1
	pass # Replace with function body.
