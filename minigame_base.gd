extends Node2D; class_name Minigame

@export var id : int
@export var minigame : PackedScene
@export var mini_time : float
@export var mini_income : int
@onready var mini_state : bool
@onready var mini_timer: Timer = $MinigameTimer
@onready var catarLixo = preload("res://catar_lixo.tscn")

signal minigame_decider(mini_state: bool)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mini_timer.wait_time = mini_time
	var minigame_inst = minigame.instantiate()
	add_child(minigame_inst)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_minigame_timer_timeout() -> void:
	minigame_decider.emit(false)

func _on_minigame_decider(mini_state: Variant) -> void:
	if mini_state == true:
		$"../../../../".money += mini_income * 3
	else:
		pass
	$"../".queue_free()
