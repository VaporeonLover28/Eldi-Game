extends Node2D;

@export var taskitemlist : Array[Upgrade_resource]

@warning_ignore("unused_signal")
signal minigame_result(minigame_state: bool, minigame_indentifier: Node2D)

@onready var rng = RandomNumberGenerator.new()
@onready var game_scene: Node2D = $"../.."
@onready var minigame_window = preload("res://minigame_window.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("create minigame"):
		_add_minigame_window()

func _on_minigame_result(minigame_state: bool, minigame_window_identifier: Node) -> void:
	#deciding the minigame was lost or not and removing from the game scene
	#OBS: mingigame_state: true = won and false = losing,
	if minigame_state == true:
		game_scene.money += minigame_window_identifier.minigame_chosen.minigame_win_income
	else:
		pass
	minigame_window_identifier.queue_free()

func _add_minigame_window() -> void:
	#randomizing minigame
	var minigame_chosen = taskitemlist.pick_random()
	#adding the minigame window and putting its varibles
	var minigame_window_inst = minigame_window.instantiate()
	minigame_window_inst.position = Vector2(rng.randf_range(0, 500),rng.randf_range(100, 500))
	minigame_window_inst.size = minigame_chosen.minigame_window_size
	minigame_window_inst.find_child("TextureButton").size = minigame_chosen.minigame_window_size
	minigame_window_inst.minigame_chosen = minigame_chosen
	#configuring the timer of the window
	minigame_window_inst.find_child("MinigameTimeout").wait_time = minigame_chosen.minigame_time
	minigame_window_inst.find_child("MinigameTimeout").\
	connect("timeout", _on_minigame_result.bind(false, minigame_window_inst))
	#adding the minigame window proprely to the root
	add_child(minigame_window_inst)
	print(minigame_chosen.minigame_time)
