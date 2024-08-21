extends Node2D

@export var health = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	var hurtbox = $Hurtbox
	hurtbox.damage_taken.connect(on_damage_taken)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_damage_taken(damage):
	health -= damage
	prints("Damage taken", damage, health)
	#TODO: Update damage label
