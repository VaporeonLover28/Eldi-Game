extends Control

@onready var grid_container: GridContainer = $GridContainer

@onready var minigame_handler = $"../../../"
@onready var minigame_window = $"../../"

@onready var long_pipe_texture = preload("res://icon.svg")
@onready var curved_pipe_texture = preload("res://teste tamanho 3232.png")


@onready var correct_response_list: Array = [
	#CR = cano reto CT = cano torto
	#if [x, false, false] = 0
	#if [x, true, false] = 90°
	#if [x, false, true] = 180°
	#if [x, true, true] = 270
	#if null is not important for the answer, 
	#make sure that any other solution are impossible as they will not count any
	[["CR", null], ["CT", null], ["CT", null], ["CT", null], ["CT", true, false], ["CT", null], ["CR", null], ["CR", null], ["CR", null]]
	]
	
@onready var current_correct_response: Array = correct_response_list.pick_random()

func _ready() -> void:
	
	#for loop to decide
	for item in grid_container.get_child_count():
		if current_correct_response.get(item).get(0) == "CR":
			grid_container.get_child(item).texture_normal = long_pipe_texture
		else:
			grid_container.get_child(item).texture_normal = curved_pipe_texture
			
func _physics_process(delta: float) -> void:
	
	#for loop that check every frame for the correct answer decide by 
	for item in range(grid_container.get_child_count()):
		if(current_correct_response.get(item).get(1) == null or (current_correct_response.get(item).get(1) == grid_container.get_child(item).flip_v) and (current_correct_response.get(item).get(0) == "CR" or current_correct_response.get(item).get(2) == grid_container.get_child(item).flip_h)):
			pass
		else:
			return
	
	minigame_handler.minigame_result.emit(true, minigame_window)
