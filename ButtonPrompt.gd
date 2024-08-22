extends Node2D

signal selfTerminate
var successful_press_count = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	#var time = get_node("Timer") as Timer
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("A"):
		successful_press_count += 1
	if successful_press_count >= 3:
		selfTerminate.emit(self)

func _on_timer_timeout():
	#free()
	selfTerminate.emit(self)
	pass # Replace with function body.

func get_Successes():
	return successful_press_count
