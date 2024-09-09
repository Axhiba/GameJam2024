extends CollisionShape2D

####
# This script watches for user input and creates a doll in 
# the (Presumingly Dollmarker Class) Parent Object if we click in it. 
####

signal addedDoll

var dollScene = preload("res://doll_projectile.tscn")
var isEnabled = false
var doll

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_input_event(viewport, event, shape_idx):
	if !isEnabled:
		return
	if event is InputEventMouseButton: 
		if event.pressed:
			doll = dollScene.instantiate()
			doll.position = position
			#doll.set_axis_velocity(-(event.position - global_position) * 10)
			add_child(doll)
			addedDoll.emit()

func _on_doll_marker_activated():
	isEnabled = true

func _on_doll_marker_disabled():
	isEnabled = false

func triggerExplosion():
	if is_instance_valid(doll):
		doll.attack()
		remove_child(doll)
