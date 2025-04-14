extends Label

@onready var game = $"../../.."

#when adding new item:
#add new equation with its income
func _process(delta: float) -> void:
	text = "Income: $" + str(\
	(game.amountposters * game.idleitemlist[0].Income)\
	 + (game.amountlightbulbs * game.idleitemlist[1].Income)\
	 + (game.amountstrikes * game.idleitemlist[2].Income)\
	 + (game.amountfilters * game.idleitemlist[3].Income)) + "/s"
