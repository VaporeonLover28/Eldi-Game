extends Node2D;

@warning_ignore("unused_signal")
signal minigame_result(minigame_state: bool, minigame_indentifier: Node2D)

@onready var rng = RandomNumberGenerator.new()
@onready var game_scene: Node2D = $"../.."
@onready var minigame_window = preload("res://minigame_window.tscn")
@onready var money_popup = preload("res://minigame_money_earn.tscn")
@onready var minigame_add_timer: Timer = $MinigameAddTimer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("create minigame"):
		_add_minigame_window()

func _on_minigame_result(minigame_state: bool, minigame_window_identifier: Node) -> void:
	#deciding the minigame was lost or not and removing from the game scene
	#OBS: mingigame_state: true = won and false = losing,
	if minigame_state == true:
		var money_inst = money_popup.instantiate()
		money_inst.scale = Vector2(4, 4)
		money_inst.position = minigame_window_identifier.global_position - Vector2(0, 40)
		money_inst.set_text2(minigame_window_identifier.minigame_chosen.minigame_win_income)
		game_scene.get_child(2).add_child(money_inst)
		game_scene.money += minigame_window_identifier.minigame_chosen.minigame_win_income
	else:
		pass
		
	if game_scene.minigame_started and get_child_count() < 2:
		game_scene.minigame_started = false
	minigame_window_identifier.queue_free()

func _add_minigame_window() -> void:
	minigame_add_timer.start(randi_range(40, 60))
	if game_scene.unlocked_tasks.size() > 0:
		#randomizing minigame
		var minigame_chosen = game_scene.unlocked_tasks.pick_random()
		#adding the minigame window and putting its varibles
		var minigame_window_inst = minigame_window.instantiate()
		minigame_window_inst.position = Vector2(rng.randf_range(400 , 1100),rng.randf_range(300, 600))
		minigame_window_inst.size = minigame_chosen.minigame_window_size
		minigame_window_inst.find_child("TextureButton").size = minigame_chosen.minigame_window_size
		minigame_window_inst.minigame_chosen = minigame_chosen
		#configuring the timer of the window
		minigame_window_inst.find_child("MinigameTimeout").wait_time = minigame_chosen.minigame_time
		minigame_window_inst.find_child("MinigameTimeout").\
		connect("timeout", _on_minigame_result.bind(false, minigame_window_inst))
		#adding the minigame window proprely to the root
		add_child(minigame_window_inst)
		#print(minigame_chosen.minigame_time)
