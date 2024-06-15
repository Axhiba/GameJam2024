extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#TODO: rotate this node between two angles
	pass


func _on_laser_testing_button_button_down():
	print('testing laser')
	var laser = Line2D.new()
	laser.add_point(position)
	var reticle = get_node("ReticleLocation")
	laser.add_point(reticle.position * 20)


	add_child(laser)
	pass # Replace with function body.
