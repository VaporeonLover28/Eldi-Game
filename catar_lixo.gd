extends Node2D

@onready var money_popup = preload("res://minigame_money_earn.tscn")
@onready var trashitem = preload("res://thrashitem.tscn")
@onready var collectedtrash = 0
@onready var game = $"../../../../../"
@onready var minigame_handler = $"../../../"
@onready var mingame_window = $"../../"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if collectedtrash == 15:
		var money_inst = money_popup.instantiate()
		money_inst.position = self.global_position
		money_inst.set_text2(mingame_window.minigame_chosen.minigame_step_income)
		game.get_child(1).add_child(money_inst)
		minigame_handler.minigame_result.emit(true, mingame_window)

func _on_spawn_trash_timeout() -> void:
	var lixo_inst = trashitem.instantiate()
	#lixo_inst.position = Vector2(randf_range(0, minigame_window_size.x), randf_range(0, minigame_window_size.y))
	#print(lixo_inst.position)
	lixo_inst.position = Vector2(randf_range(0, 100), randf_range(0, 100))
	add_child(lixo_inst)
