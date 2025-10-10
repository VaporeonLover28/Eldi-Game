extends Node2D

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
		minigame_handler.minigame_result.emit(true, minigame_window)

func _on_spawn_trash_timeout() -> void:
	var lixo_inst = trashitem.instantiate()
	#lixo_inst.position = Vector2(randf_range(0, minigame_window_size.x), randf_range(0, minigame_window_size.y))
	#print(lixo_inst.position)
	lixo_inst.position = Vector2(randf_range(10, minigame_window.size.x -30), randf_range(10, minigame_window.size.y -30))
	add_child(lixo_inst)
