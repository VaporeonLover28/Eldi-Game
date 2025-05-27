extends Control

@onready var grid_container: GridContainer = $GridContainer

@onready var minigame_handler = $"../../../"
@onready var minigame_window = $"../../"

@onready var long_pipe_texture = preload("res://360_F_134590857_W1F1DVkYl8KnvXKqK4SCTKDcdxdLNqOj.jpg")
@onready var curved_pipe_texture = preload("res://Pipe-cartoon-vector-Metal-pipeline-conn-Graphics-41172428-1-1-580x387.jpg")
@onready var plus_pipe_texture = preload("res://teste tamanho 6464.png")

@onready var correct_response_list: Array = [
	#first element:
	#CR = Cano reto,
	#CC = Cano curvo,
	#CM = Cano mais
	#second element:
	#null is not important for the answer,
	#or put the degree that it need to be for the answer 
	#if your response is for a "CR", you have to put 0 or 90 as the possible response
	#make sure that any other solution are impossible as they will not count any
	[["CC", null], ["CR", null], ["CC", 0], ["CC", 180], \
	["CC", null], ["CR", null], ["CC", 270], ["CC", 90], \
	["CC", 0], ["CR", 0], ["CR", 0], ["CC", 180], \
	["CC", 270], ["CR", 0], ["CR", 0], ["CR", 0]]
	
	#[[XX, xx], [XX, xx], [XX, xx], [XX, xx], \
	#[XX, xx], [XX, xx], [XX, xx], [XX, xx], \
	#[XX, xx], [XX, xx], [XX, xx], [XX, xx], \
	#[XX, xx], [XX, xx], [XX, xx], [XX, xx],
	]
@onready var current_correct_response: Array = correct_response_list.pick_random()

func _ready() -> void:
	#for loop to decide
	for item in grid_container.get_child_count():
		match current_correct_response.get(item).get(0):
			"CR":
				grid_container.get_child(item).get_child(0).texture_normal = long_pipe_texture
			"CC":
				grid_container.get_child(item).get_child(0).texture_normal = curved_pipe_texture
			"CM":
				grid_container.get_child(item).get_child(0).texture_normal = plus_pipe_texture
		grid_container.get_child(item).get_child(0).minigame_start()
func _physics_process(delta: float) -> void:
	
	#for loop that check every frame for the correct answer decide by 
	for item in range(grid_container.get_child_count()):
		if(current_correct_response.get(item).get(1) == null or  \
		(current_correct_response.get(item).get(1) == \
		grid_container.get_child(item).get_child(0).rotation_degrees)):
			pass
		else:
			return
	minigame_handler.minigame_result.emit(true, minigame_window)
	
	#if checar_cano_reto() == true
