extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_attack_1_button_pressed():
	self.visible = false
	pass # Replace with function body.


func _on_attack_2_button_pressed():
	self.visible = false
	pass # Replace with function body.

func _on_enemy_list_attack_finished():
	self.visible = true
	pass # Replace with function body.
