extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_enemy_list_battle_won(text):
	visible = true
	var BattleTextLabel = get_node("RichTextLabel")
	BattleTextLabel.text = "[font_size=22][center]" + text + "[/center]"
	pass # Replace with function body.
