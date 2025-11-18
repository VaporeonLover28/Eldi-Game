extends Node2D;

@warning_ignore("unused_signal")
signal minigame_result(minigame_state: bool, minigame_indentifier: Node2D)

@onready var rng = RandomNumberGenerator.new()
@onready var game_scene: Node2D = $".."
@onready var prompt = preload("res://minigame_prompt.tscn")
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
		money_inst.set_text2(minigame_window_identifier.minigame.minigame_win_income)
		game_scene.get_child(3).add_child(money_inst)
		game_scene.money += minigame_window_identifier.minigame.minigame_win_income
	else:
		pass
		
	if game_scene.minigame_started and get_children().size() < 3:
		game_scene.minigame_started = false
	minigame_window_identifier.queue_free()

func _add_minigame_window() -> void:
	minigame_add_timer.start(randi_range(41, 60))
	if game_scene.unlocked_tasks.size() > 0:
		#randomizing minigame
		var minigame_chosen = game_scene.unlocked_tasks.pick_random()
		#adding the minigame window and putting its varibles
		var prompt_inst = prompt.instantiate()
		prompt_inst.position = Vector2(rng.randf_range(-200, 1200),rng.randf_range(-300, 900))
		prompt_inst.minigame = minigame_chosen
		#configuring the timer of the window
		#adding the minigame window proprely to the root
		add_child(prompt_inst)
		prompt_inst.timeout.connect("timeout", _on_minigame_result.bind(false, prompt_inst))
		prompt_inst.timeout.wait_time = minigame_chosen.minigame_time
		prompt_inst.timeout.start()
		#print(minigame_chosen.minigame_time)
