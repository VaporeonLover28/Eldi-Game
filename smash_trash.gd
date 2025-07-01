extends Node2D
@onready var minigame_handler = $"../../../"
@onready var minigame_window = $"../../"
@onready var timer_smash_trash: Timer = $Timer
@onready var animation_wait_time: Timer = $Animation_wait_time
@onready var label: Label = $Label
@onready var color_rect: ColorRect = $ColorRect

signal clicked_moused

var critical_time: float = 1.0

@onready var critical_points_array: Array = [
	[5.0, 8.0, 2.0]
]
var threshhold: float = 0.2
@onready var critical_points_chosen: Array = critical_points_array.pick_random()
var times_smashed_correctly : int = 0
var  times_smashed : int = 0
@onready var times_to_smash : int = critical_points_chosen.size()
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	timer_smash_trash.start(critical_points_chosen[0])
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer_smash_trash.time_left - threshhold < critical_time:
		color_rect.color = Color.GREEN
	else:
		color_rect.color = Color.RED
		
	label.text = str(timer_smash_trash.time_left)
	
	if Input.is_action_just_pressed("click"):
		_on_timed_smash()
	

func _on_timed_smash():
	times_smashed += 1
	animation_wait_time.start()
	print(times_smashed)
	if times_smashed == times_to_smash:
		if times_smashed_correctly == times_to_smash:
			minigame_handler.minigame_result.emit(true, minigame_window)
		else:
			minigame_handler.minigame_result.emit(false, minigame_window)
			
	if timer_smash_trash.time_left - threshhold < critical_time:
		timer_smash_trash.start(critical_points_chosen[times_smashed])
		print("acertou")
	else:
		timer_smash_trash.start(critical_points_chosen[times_smashed])
		print("errou")
	
	await animation_wait_time.timeout
	
	
