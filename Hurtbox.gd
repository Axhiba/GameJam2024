extends Area2D

signal damage_taken(damage)
@export var type: String
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func takeAttack(damage):
	damage_taken.emit(damage)
