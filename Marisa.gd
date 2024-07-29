extends Node2D
var reticleScene = preload("res://laser_reticle.tscn")

var maxLaserCount = 5
var currentLaserCount = 0
var laserCooldown = 0.7
var timeSinceLaser = laserCooldown
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
	
	
func startMove1():
	print_debug("I was here!")
	pass

func startMove2():
	move2Started = true
	var reticle = reticleScene.instantiate()
	add_child(reticle)

func endMove2():
	var reticle = get_node("LaserReticle")
	remove_child(reticle)

func laserAttack():
	var reticle = get_node("LaserReticle")
	reticle.addLaser()
	timeSinceLaser = 0

func _input(event):
	if event.is_action_pressed("A"):
		if laserReady:
			currentLaserCount += 1
			laserAttack()
