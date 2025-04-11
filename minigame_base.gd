extends Node2D; class_name Minigame

@export var minigame_scene : PackedScene
@export var minigame_id : int
@export var minigame_time : float
@export var minigame_step_income : int
@export var minigame_win_income : int
@onready var minigame_state : bool
@onready var minigame_timer: Timer = $MinigameTimer
signal minigame_result(mini_state: bool)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_minigame_timer_timeout() -> void:
	minigame_result.emit(false)

func _on_minigame_result(mini_state: bool) -> void:
	if mini_state == true:
		$"../../../../".money += minigame_win_income
	else:
		pass
	$"../".queue_free()

func choose_minigame(chosengame):
	minigame_id = chosengame.array_pos
