extends Node2D
var dollScene = preload("res://doll_projectile.tscn")
var isStarted = false
var isDragging = false

var thrownDolls = [] #maybe dictionary
var throwIndicator: Line2D
var currentDoll: DollProjectile


# Called when the node enters the scene tree for the first time.
func _ready():
	throwIndicator = get_node("ThrowIndicator")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_drag_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton: 
		if !event.pressed && isDragging:
			isDragging = false
			#create doll and throw doll
			#currentDoll.set_axis_velocity(-(event.position - global_position) * 5)
			var doll = dollScene.instantiate()
			doll.position = position
			doll.set_axis_velocity(-(event.position - global_position) * 10)
			add_child(doll)
	elif event is InputEventMouseMotion && isDragging:
		#var pos = event.relative
		var pos = event.position
		var multiplier = 1
		throwIndicator.set_point_position(1, -(pos - global_position) * multiplier)

func _on_initial_click_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			isDragging = true


