extends Node2D

@onready var trashitem = preload("res://thrashitem.tscn")
@onready var collectedtrash = 0
@onready var minigame_handler = $"../../../"
@onready var minigame_step_income : int
@onready var minigame_win_income : int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if collectedtrash == 15:
		minigame_handler.minigame_result.emit(true, self)

func _on_spawn_trash_timeout() -> void:
	var lixo_inst = trashitem.instantiate()

	lixo_inst.position = Vector2(randf_range(0, 250), randf_range(0, 250))
	add_child(lixo_inst)
