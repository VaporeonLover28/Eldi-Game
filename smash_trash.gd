extends Node2D

@onready var game = $"../../../../../"
@onready var minigame_handler = $"../../../"
@onready var minigame_window = $"../../"
@onready var timer_smash_trash: Timer = $Timer
@onready var animation_wait_time: Timer = $Animation_wait_time
@onready var label: Label = $Label
@onready var prensa: Node2D = $prensa
@onready var nor_trash = preload("res://rec_thrash_normal.tscn")
@onready var cru_trash = preload("res://rec_trash_crushed.tscn")

signal clicked_moused

@onready var critical_points_array: Array = [
	[4.0, 7.0, 12.0],
	[4.5, 10, 14],
	[5.0, 9.0, 12.0],
	[5.0, 8.0, 13.0],
]
@onready var critical_points_chosen: Array = critical_points_array.pick_random()
var times_smashed_correctly : int = 0
@onready var times_to_smash : int = critical_points_chosen.size()

var can_crush := true

func _ready() -> void:
	if !game.minigame_started:
		game.minigame_started = true
	#print(critical_points_chosen)
	timer_smash_trash.start(15)
	for time in critical_points_chosen:
		var inst = nor_trash.instantiate()
		inst.position.y = 269
		inst.position.x = time * 100 + 220 - 18
		add_child(inst)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click") and can_crush:
		crush()

func crush():
	can_crush = false
	var tween = create_tween()
	tween.tween_property(prensa, "position", Vector2.ZERO, 0.75).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_EXPO)
	tween.tween_callback(func():animation_wait_time.start(1))
	tween.tween_property(prensa, "position", Vector2(0, -170), 1).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_LINEAR)
	tween.tween_callback(func():can_crush = true)

func _on_timer_timeout() -> void:
	if times_smashed_correctly == times_to_smash:
		minigame_handler.minigame_result.emit(true, minigame_window)
	else:
		minigame_handler.minigame_result.emit(false, minigame_window)

func _on_clicked_moused() -> void:
	get_tree().quit()

func _on_collision_body_entered(body: Node2D) -> void:
	var crushed = cru_trash.instantiate()
	times_smashed_correctly += 1
	add_child(crushed)
	crushed.global_position = body.global_position
	body.queue_free()
