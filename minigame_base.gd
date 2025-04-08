extends Node2D; class_name Minigame

@export var id : int
@export var minigame : Node2D
@export var mini_time : float
@export var mini_income : int
@onready var mini_state : bool
@onready var mini_timer: Timer = $MinigameTimer
@onready var catarLixo = preload("res://catar_lixo.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mini_timer.wait_time = mini_time
	var catar_lixo_inst = catarLixo.instantiate()
	add_child(catar_lixo_inst)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _gain_income():
	$"../../".money += mini_income

func _on_minigame_timer_timeout() -> void:
	#se ganhar:
		#_gain_income()
	#se perder:
		#nada
	pass
