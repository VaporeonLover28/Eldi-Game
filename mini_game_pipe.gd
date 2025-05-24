extends Control

@onready var grid_container: GridContainer = $GridContainer

@onready var minigame_handler = $"../../../"
@onready var minigame_window = $"../../"

@onready var long_pipe_texture = preload("res://icon.svg")
@onready var curved_pipe_texture = preload("res://teste tamanho 3232.png")


@onready var correct_response_list: Array = [
	#first element:
	#CR = cano reto CT = cano torto
	#second element:
	#null is not important for the answer,
	#or put the degree that it need to be for the answer 
	#make sure that any other solution are impossible as they will not count any
	[["CR", null], ["CT", null], ["CT", null], ["CT", null], ["CR", 90], ["CT", null], ["CR", null], ["CR", null], ["CR", null]]
	]
	
@onready var current_correct_response: Array = correct_response_list.pick_random()

func _ready() -> void:
	
	#for loop to decide
	for item in grid_container.get_child_count():
		if current_correct_response.get(item).get(0) == "CR":
			grid_container.get_child(item).get_child(0).texture_normal = long_pipe_texture
		else:
			grid_container.get_child(item).get_child(0).texture_normal = curved_pipe_texture
			
func _physics_process(delta: float) -> void:
	
	#for loop that check every frame for the correct answer decide by 
	for item in range(grid_container.get_child_count()):
		if(current_correct_response.get(item).get(1) == null or ((current_correct_response.get(item).get(0) == "CR" and (((current_correct_response.get(item).get(1) == 0 or current_correct_response.get(item).get(1) == 180) and (grid_container.get_child(item).get_child(0).rotation_degrees == 0 or grid_container.get_child(item).get_child(0).rotation_degrees == 180)) or ((current_correct_response.get(item).get(1) == 90 or current_correct_response.get(item).get(1) == 270) and (grid_container.get_child(item).get_child(0).rotation_degrees == 90 or grid_container.get_child(item).get_child(0).rotation_degrees == 270)))) or (current_correct_response.get(item).get(1) == grid_container.get_child(item).get_child(0).rotation_degrees))):
			pass
		else:
			return
	print("ganhou")
	#minigame_handler.minigame_result.emit(true, minigame_window)
