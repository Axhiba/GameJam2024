extends Node2D

signal death

@export var health = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	var hurtbox = $Hurtbox
	$HPLabel.text = str(health)
	hurtbox.damage_taken.connect(on_damage_taken)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health <= 0:
		death.emit()
		queue_free()
	pass

func on_damage_taken(damage):
	health -= damage
	prints("Damage taken", damage, health)
	$HPLabel.text = str(health)
	$DamageLabel.text = str(damage)
	await get_tree().create_timer(1.5).timeout
	$DamageLabel.text = ""

func attack():
	print("Ouch!")
