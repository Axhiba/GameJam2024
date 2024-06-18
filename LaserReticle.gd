extends Node2D
var rotation_direction = 1
@export var rotation_speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var nintyDegrees = PI/2
	if rotation <= -nintyDegrees:
		rotation_direction = 1
	elif rotation >= 0:
		rotation_direction = -1
	rotation += rotation_direction * rotation_speed * delta
	print(rotation)


func _on_laser_testing_button_button_down():
	print('testing laser')
	var laser = Line2D.new()
	laser.add_point(position)
	var reticle = get_node("ReticleLocation")
	laser.add_point(reticle.position * 20)


	add_child(laser)
	pass # Replace with function body.
