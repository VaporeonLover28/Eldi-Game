extends Node2D
@onready var minigame_handler = $"../../../../"
@onready var minigame_window = $"../../../"
@onready var timer_smash_trash: Timer = $Timer
@onready var animation_wait_time: Timer = $Animation_wait_time
@onready var label: Label = $Label

@onready var nor_trash = preload("res://rec_thrash_normal.tscn")
@onready var cru_trash = preload("res://rec_trash_crushed.tscn")

signal clicked_moused

var critical_time: float = 1.0
var threshhold: float = 0.4
var trash_velocity: float = -100.0  # pixels per second

@onready var critical_points_array: Array = [
	[4.0, 5.0, 3.0],
	[4.5, 1.5, 1.5],
	[5.0, 1.0, 1.0],
	[4.0, 3.0, 2.0],
]
@onready var critical_points_chosen: Array = critical_points_array.pick_random()
var times_smashed_correctly : int = 0
var times_smashed : int = 0
@onready var times_to_smash : int = critical_points_chosen.size()
var hittable_trash := false
var current_trash_index: int = 0
var trash_instances: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Critical points: ", critical_points_chosen)
	
	# Spawn trash cans at positions where they'll reach the press at the right time
	var press_x_position: float = 220  # Assuming this is the press position
	
	for i in range(critical_points_chosen.size()):
		var inst = nor_trash.instantiate()
		
		# Calculate spawn position: distance = velocity * time
		var distance_to_travel = abs(trash_velocity) * critical_points_chosen[i]
		inst.position = Vector2(press_x_position + distance_to_travel, 269)
		
		add_child(inst)
		trash_instances.append(inst)
		print("Trash ", i, " spawned at x: ", inst.position.x, " with time: ", critical_points_chosen[i])
	
	# Start timer for first trash can
	timer_smash_trash.start(critical_points_chosen[0])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = "Time left: %.2f" % timer_smash_trash.time_left
	
	# Calculate if we're in the hittable window
	var time_until_smash = timer_smash_trash.time_left
	hittable_trash = time_until_smash <= critical_time and time_until_smash >= (critical_time - threshhold)
	
	if Input.is_action_just_pressed("click"):
		_on_timed_smash()

func _on_timed_smash():
	if hittable_trash:
		print("Hit at correct time!")
		times_smashed_correctly += 1
		# Visual feedback - change trash can to crushed
		if current_trash_index < trash_instances.size():
			trash_instances[current_trash_index].queue_free()
			var crushed = cru_trash.instantiate()
			crushed.position = trash_instances[current_trash_index].position
			add_child(crushed)
	else:
		print("Missed timing!")
	
	# Move to next trash can
	current_trash_index += 1
	times_smashed += 1
	
	if current_trash_index < critical_points_chosen.size():
		# Start timer for next trash can with exact timing
		timer_smash_trash.start(critical_points_chosen[current_trash_index])
	else:
		# All trash cans processed
		_end_minigame()

func _on_timer_timeout() -> void:
	# Timer ran out without player input
	print("Timeout for trash can ", current_trash_index)
	times_smashed += 1
	current_trash_index += 1
	
	if current_trash_index < critical_points_chosen.size():
		timer_smash_trash.start(critical_points_chosen[current_trash_index])
	else:
		_end_minigame()

func _end_minigame():
	var success = times_smashed_correctly == times_to_smash
	print("Game over. Correct: ", times_smashed_correctly, "/", times_to_smash)
	minigame_handler.minigame_result.emit(success, minigame_window)
