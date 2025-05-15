extends Label

@onready var game = $"../../../../../../../../"
@onready var shoppanel: Control = $".."

#when adding new item:
#add new switch case with number and amount
func _process(delta: float) -> void:
	match shoppanel.upgrade_arraypos:
		0:
			text = "(" + str(game.amountposters) + ")"
		1:
			text = "(" + str(game.amountlightbulbs) + ")"
		2:
			text = "(" + str(game.amountstrikes) + ")"
		3:
			text = "(" + str(game.amountfilters) + ")"
