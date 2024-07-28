extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var time = get_node("Timer") as Timer
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_timer_timeout():
	free()
	pass # Replace with function body.
