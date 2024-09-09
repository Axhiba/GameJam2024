extends Node2D

var dollScene = preload("res://doll_projectile.tscn")
var dollMarkerScene = preload("res://DollMarker.tscn")

var doll_count = 0
var check = true
signal turnCompleted

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print_debug(doll_count)
	if check && doll_count >= 3:
		turnCompleted.emit()
		check = false


func _on_doll_marker_added_doll():
	doll_count += 1


func _on_doll_marker_2_added_doll():
	doll_count += 1


func _on_doll_marker_3_added_doll():
	doll_count += 1

func _on_doll_marker_4_added_doll():
	doll_count += 1


func _on_doll_marker_5_added_doll():
	doll_count += 1

func blowDollsUp(num):
	for _markers in self.get_children():
		if num == 0:
			return
		for _markerChild in _markers.get_children():
			if _markerChild is Area2D:
				for _areaChild in _markerChild.get_children():
					if _areaChild is CollisionShape2D:
						_areaChild.triggerExplosion()
						num -= 1

