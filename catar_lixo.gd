extends Node2D

@onready var money_popup = preload("res://minigame_money_earn.tscn")
@onready var trashitem = preload("res://thrashitem.tscn")
@onready var collectedtrash = 0
@onready var game = $"../../../../../"
@onready var minigame_handler = $"../../../"
@onready var minigame_window = $"../../"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !game.minigame_started:
		game.minigame_started = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if collectedtrash == 15:
		var money_inst = money_popup.instantiate()
		money_inst.scale = Vector2(4, 4)
		money_inst.position = minigame_window.global_position - Vector2(0, 40)
		money_inst.set_text2(minigame_window.minigame_chosen.minigame_win_income)
		game.get_child(2).add_child(money_inst)
		minigame_handler.minigame_result.emit(true, minigame_window)

func _on_spawn_trash_timeout() -> void:
	var lixo_inst = trashitem.instantiate()
	#lixo_inst.position = Vector2(randf_range(0, minigame_window_size.x), randf_range(0, minigame_window_size.y))
	#print(lixo_inst.position)
	lixo_inst.position = Vector2(randf_range(10, minigame_window.size.x -30), randf_range(10, minigame_window.size.y -30))
	add_child(lixo_inst)
