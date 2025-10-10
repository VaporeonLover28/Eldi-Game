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
	money_inst.position = self.position + get_parent().get_parent().get_parent().position - Vector2(20, 20)
	money_inst.set_text2(minigame_window.minigame_chosen.minigame_step_income)
	game.get_child(2).add_child(money_inst)
	print(game)
	print(money_inst)
	print(self.position)
	print("trash collected")
	queue_free()
