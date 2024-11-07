extends Node2D

signal death

@export var health = 10
var attacking = false
var attackPathScene = preload("res://BakebakeAttackPath1.tscn")
var currentPathFollow
var hitbox
# Called when the node enters the scene tree for the first time.
func _ready():
	var hurtbox = $Hurtbox
	$HPLabel.text = str(health)
	hurtbox.damage_taken.connect(on_damage_taken)
	hitbox = $Hitbox

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#currentPathFollow.progress += 3
	if health <= 0:
		death.emit()
		queue_free()

func on_damage_taken(damage):
	health -= damage
	prints("Damage taken", damage, health)
	$HPLabel.text = str(health)
	$DamageLabel.text = str(damage)
	await get_tree().create_timer(1.5).timeout
	$DamageLabel.text = ""

func attack():
	print("Ouch!")
	#var players = get_tree().get_nodes_in_group("Players")
	#var attackPath = attackPathScene.instantiate()
	#var attackCurve = attackPathScene.get_curve()
	#
	#var pathToBeginningOfAttack = Curve2D.new()
	#pathToBeginningOfAttack.addPoint(global_position)
	#
	#var attackPoints = attackCurve.get_baked_points()
	#for point in attackPoints:
		#pathToBeginningOfAttack.addPoint(point)
	#$Path2D.set_curve(pathToBeginningOfAttack)
	
	
