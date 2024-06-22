extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	

func _on_laser_testing_button_button_down():
	print('testing laser')
	var reticle = get_node("LaserReticle")
	reticle.addLaser()
	#var laser = laserScene.instantiate()
	#laser.setPointThroughReticle(reticle)
	#add_child(laser)
