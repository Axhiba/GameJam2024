extends Node2D

var isStarted = false
var isDragging = false

var thrownDolls = [] #maybe dictionary
var throwIndicator: Line2D
var currentDoll: DollProjectile
# Called when the node enters the scene tree for the first time.
func _ready():
	throwIndicator = get_node("ThrowIndicator")
	currentDoll = get_node("DollProjectile")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_drag_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton: 
		if !event.pressed:
			isDragging = false
		print('_on_drag_area_input_event isDragging:' + str(isDragging))
	elif event is InputEventMouseMotion && isDragging:
		#var pos = event.relative
		var pos = event.position
		
		print('setting throwIndicator: ' + str(pos))
		print('position of node: ' + str(global_position))
		
		var multiplier = 1
		throwIndicator.set_point_position(1, -(pos - global_position) * multiplier)

func _on_initial_click_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			isDragging = true
		print('_on_initial_click_area_input_event isDragging: ' + str(isDragging))

