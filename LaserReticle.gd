extends Node2D
var laserScene = preload("res://laser.tscn")


var rotation_direction = 1
@export var rotation_speed = 1
@export var reticleUpperBound = -PI/2
@export var reticleLowerBound = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rotation <= reticleUpperBound:
		rotation_direction = 1
	elif rotation >= reticleLowerBound:
		rotation_direction = -1
	rotation += rotation_direction * rotation_speed * delta
	
func addLaser():
	var reticle = get_node("ReticleLocation")
	var laser = laserScene.instantiate()
	var reticlePosition = reticle.position
	laser.setPointThroughReticle(rotation, reticlePosition)
	add_sibling(laser)
