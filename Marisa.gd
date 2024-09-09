extends Node2D

@export var maxHealth = 20
@export var currentHealth = maxHealth

signal initiateExplosions
var reticleScene = preload("res://laser_reticle.tscn")
var buttonPromptScene = preload("res://button_prompt.tscn")

var maxLaserCount = 5
var currentLaserCount = 0
var laserCooldown = 0.7
var timeSinceLaser = laserCooldown
var success = 0
var laserReady: bool:
	get:
		return move2Started && timeSinceLaser >= laserCooldown && currentLaserCount < maxLaserCount
var move2Started = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if move2Started:
		timeSinceLaser += delta
	pass

func updateHealthUI():
	BattleEvent.playerHealthUpdated.emit(currentHealth, maxHealth, "Marisa")
	
func startMove1():
	success = 0
	var input_prompt = buttonPromptScene.instantiate()
	add_child(input_prompt)
	input_prompt.connect("selfTerminate", _on_button_timeout)
	pass

func endMove1():
	var input_prompt = get_node("button_prompt")
	remove_child(input_prompt)

func startMove2():
	move2Started = true
	var reticle = reticleScene.instantiate()
	add_child(reticle)

func endMove2():
	var reticle = get_node("LaserReticle")
	remove_child(reticle)
	move2Started = false

func laserAttack():
	var reticle = get_node("LaserReticle")
	reticle.addLaser()
	timeSinceLaser = 0

func _input(event):
	if event.is_action_pressed("A"):
		if laserReady:
			currentLaserCount += 1
			laserAttack()

func _on_button_timeout(button):
	success = button.get_Successes()
	remove_child(button)
	button.queue_free()
	if success != 0:
		initiateExplosions.emit()
	
func get_Successes():
	return success
