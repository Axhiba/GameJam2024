extends Node2D
var reticleScene = preload("res://laser_reticle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func startMove1():
	print_debug("I was here!")
	pass

func startMove2():
	var reticle = reticleScene.instantiate()
	add_child(reticle)

func endMove2():
	var reticle = get_node("LaserReticle")
	remove_child(reticle)

func laserAttack():
	print('testing laser')
	var reticle = get_node("LaserReticle")
	reticle.addLaser()

func _on_laser_testing_button_button_down():
	#TODO: change to button press
	laserAttack()
	#var laser = laserScene.instantiate()
	#laser.setPointThroughReticle(reticle)
	#add_child(laser)
