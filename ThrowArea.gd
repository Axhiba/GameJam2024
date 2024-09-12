extends Node2D
var dollScene = preload("res://doll_projectile.tscn")
var throwStrength = 8

var isStarted = false
var isDragging = false

var maxDollCount = 5

var thrownDolls = [] #maybe dictionary
var throwIndicator: Line2D
var currentDoll: DollProjectile

var timeSinceThrow = 1
var throwCooldown = 1

signal dollThrown

var dollThrowReady: bool:
	get:
		return thrownDolls.size() < maxDollCount && timeSinceThrow >= throwCooldown

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
			var doll = dollScene.instantiate()
			doll.position = position
			doll.set_axis_velocity(-(event.position - global_position) * throwStrength)
			add_child(doll)
			thrownDolls.push_back(doll)
			dollThrown.emit()
			if thrownDolls.size() == 5:
				doll.stopped_moving.connect(on_last_doll_stopped)
	elif event is InputEventMouseMotion && isDragging:
		#var pos = event.relative
		var pos = event.position
		var multiplier = 1
		throwIndicator.set_point_position(1, -(pos - global_position) * multiplier)

func _on_initial_click_area_input_event(viewport, event, shape_idx):
	if dollThrowReady:
		if event is InputEventMouseButton:
			if event.pressed:
				isDragging = true

func on_last_doll_stopped():
	startDollAttacks()
	
func startDollAttacks():
	for doll in thrownDolls:
		if is_instance_valid(doll):
			doll.attack()
			remove_child(doll)
	BattleEvent.move2Ended.emit()
