extends Node2D;

@export var taskitemlist : Array[Upgrade_resource]

@warning_ignore("unused_signal")
signal minigame_result(minigame_state: bool, minigame_indentifier: Node2D)

@onready var rng = RandomNumberGenerator.new()
@onready var game_scene: Node2D = $"../.."
@onready var minigame_window = preload("res://minigame_window.tscn")
@onready var minigame_timeout = preload("res://minigame_timeout.tscn")

#getting the last minigame window and minigame reference on minigame manger
var latest_minigame_window = get_child(-1)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("create minigame"):
		_add_minigame_window()

func _on_minigame_result(minigame_state: bool, minigame_identefier: Node2D) -> void:
	#deciding the minigame was lost or not and removing from the game scene
	#OBS: mingigame_state: true = won and false = losing,
	#allways put self when when calling this function
	if minigame_state == true:
		game_scene.money += minigame_identefier.minigame_win_income
	else:
		pass
	minigame_identefier.get_parent().get_parent().queue_free()

func _minigame_timeout():
	_on_minigame_result(false, get_child(-1).get_child(0).get_child(0))


func _add_minigame_window() -> void:
	#randomizing minigame
	var minigame_chosen = taskitemlist.pick_random()
	#adding the minigame window
	var minigame_window_inst = minigame_window.instantiate()
	minigame_window_inst.position = Vector2(rng.randf_range(300, 1280),rng.randf_range(41, 720))
	add_child(minigame_window_inst)
	#adding and setting minigame to the minigamewindow
	var minigame_inst = minigame_chosen.minigame_scene.instantiate()
	minigame_inst.minigame_step_income = minigame_chosen.minigame_step_income
	minigame_inst.minigame_win_income = minigame_chosen.minigame_win_income
	get_child(-1).get_child(0).add_child(minigame_inst)
	#setting a timer for the minigame
	var minigame_timeout_inst = minigame_timeout.instantiate()
	minigame_timeout_inst.wait_time = minigame_chosen.minigame_time
	print(minigame_chosen.minigame_time)
	get_child(-1).get_child(0).get_child(0).add_child(minigame_timeout_inst)
	get_child(-1).get_child(0).get_child(0).get_node("MinigameTimeout").connect("timeout", _minigame_timeout)
