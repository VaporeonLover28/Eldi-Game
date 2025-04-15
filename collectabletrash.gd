extends TextureButton

@onready var minigame_window = $"../../../"
@onready var minigame = $"../"
@onready var game = $"../../../../../../"
@onready var money_popup = preload("res://minigame_money_earn.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	minigame.collectedtrash += 1
	game.money += minigame_window.minigame_chosen.minigame_step_income
	var money_inst = money_popup.instantiate()
	money_inst.position = game.get_child(-1).get_child(-1).position
	money_inst.set_text2(minigame_window.minigame_chosen.minigame_step_income)
	game.get_child(1).add_child(money_inst)
	queue_free()
