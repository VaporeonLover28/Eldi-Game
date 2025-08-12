extends Node2D
@onready var minigame_handler = $"../../../"
@onready var minigame_window = $"../../"
@onready var timer_smash_trash: Timer = $Timer
@onready var animation_wait_time: Timer = $Animation_wait_time
@onready var label: Label = $Label

@onready var nor_trash = preload("res://rec_thrash_normal.tscn")
@onready var cru_trash = preload("res://rec_trash_crushed.tscn")

signal clicked_moused

var critical_time: float = 1.0

@onready var critical_points_array: Array = [
	[4.0, 5.0, 3.0],
	[4.5, 1.5, 1.5],
	[5.0, 1.0, 1.0],
	[4.0, 3.0, 2.0],
]
var threshhold: float = 0.4
@onready var critical_points_chosen: Array = critical_points_array.pick_random()
var times_smashed_correctly : int = 0
var times_smashed : int = 0
@onready var times_to_smash : int = critical_points_chosen.size()
var hittable_trash := false
# Called when the node enters the scene tree for the first time.
var next_trash

func _ready() -> void:
	print(critical_points_chosen)
	var spawned_pos : int = 0
	for times in critical_points_chosen.size():
		var inst = nor_trash.instantiate()
		inst.position.y = 269
		inst.position.x = (critical_points_chosen[times] * 100 + 220) + spawned_pos
		spawned_pos = inst.position.x - 220
		print("pos: " + str(inst.position))
		add_child(inst)
	
	timer_smash_trash.start(critical_points_chosen[0])
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	label.text = str(timer_smash_trash.time_left)

	if Input.is_action_just_pressed("click"):
		animation_wait_time.start()
		_on_timed_smash()
	
	if timer_smash_trash.time_left - threshhold < critical_time:
		hittable_trash = true
	else:
		hittable_trash = false

func _on_timed_smash():
	times_smashed += 1
	animation_wait_time.start()
	timer_smash_trash.start(critical_points_chosen[times_smashed])
	if times_smashed == times_to_smash:
		if times_smashed_correctly == times_to_smash:
			minigame_handler.minigame_result.emit(true, minigame_window)
		else:
			minigame_handler.minigame_result.emit(false, minigame_window)
	if hittable_trash:
		print("acerto")
		timer_smash_trash.start(critical_points_chosen[times_smashed])
	else:
		print("erro")
		timer_smash_trash.start(critical_points_chosen[times_smashed])
