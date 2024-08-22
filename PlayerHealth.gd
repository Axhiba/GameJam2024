extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	BattleEvent.playerHealthUpdated.connect(_on_playerHealthUpdate)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_playerHealthUpdate(newHealth, maxHealth, characterName):
	if characterName == "Alice":
		$AliceHealth/Label.text = str(newHealth) + "/" + str(maxHealth)
	elif characterName == "Marisa":
		$MarisaHealth/Label.text = str(newHealth) + "/" + str(maxHealth)
