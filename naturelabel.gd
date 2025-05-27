extends Label

@onready var game = $"../../.."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "Nature Rating: " + str(100 - (game.rating * -100))
