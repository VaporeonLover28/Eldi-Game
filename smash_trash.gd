extends Control
@onready var minigame_handler = $"../../../"
@onready var minigame_window = $"../../"
@onready var timer_smash_trash: Timer = $Timer
@onready var label: Label = $Label
@onready var color_rect: ColorRect = $ColorRect

var critical_time: float = 1.0
@onready var critical_points_array: Array = [
	[1.0, 2.0, 3.0]
]
var threshhold: float = 0.2
var animation_wait_time : bool = true
@onready var critical_points_chosen: Array = critical_points_array.pick_random()
var times_smashed_correctly : int = 0
var times_to_smash : int = critical_points_chosen.size()
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	_start_time_smash()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#label.text = str(round(timer.time_left * 10))
	pass
	#if timer.time_left - threshhold < critical_time and \
	#timer.time_left + threshhold > critical_time:
		#color_rect.color = Color.GREEN
	#else:
		#color_rect.color = Color.RED
	
	#if Input.is_action_just_pressed("ui_accept") and animation_wait_time:
		#if timer_smash_trash.time_left - threshhold < critical_time and \
		#timer_smash_trash.time_left + threshhold > critical_time:
			#print("acertou")
		#else:
			#print("errou")

func _start_time_smash():
	for item in critical_points_chosen.size():
		timer_smash_trash.start(critical_points_chosen[item] + threshhold + 0.1)
		await timer_smash_trash.timeout or Input.is_action_just_pressed("ui_accept")
		if timer_smash_trash.time_left - threshhold < critical_time:
			times_smashed_correctly =+ 1
		else:
			print("errou")
		if item == times_to_smash:
			if times_smashed_correctly == times_to_smash:
				minigame_handler.minigame_result.emit(true, minigame_window)
			else:
				minigame_handler.minigame_result.emit(false, minigame_window)
