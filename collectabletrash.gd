extends TextureButton

@onready var minigame = $"../"
@onready var game = $"../../../../../../"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	minigame.collectedtrash += 1
	game.money += minigame.minigame_step_income
	queue_free()
