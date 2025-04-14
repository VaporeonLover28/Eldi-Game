extends Label

@onready var game = $"../../../../../../../.."

func _ready() -> void:
	#function on the game node
	#takes info from shopbox (resource values) that you set manually
	#in the game node receives the info
	#and sets the text here accordingly
	#(yes its confusing bro i did this all wrong)
	game.assignvalues(self, "label")
