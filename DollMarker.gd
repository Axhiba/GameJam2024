extends Node2D

var isEnabled = false

signal activated
signal disabled
signal addedDoll

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func activate():
	activated.emit()
	
func disable():
	disabled.emit()

func _on_collision_shape_2d_added_doll():
	addedDoll.emit()
	disabled.emit()


