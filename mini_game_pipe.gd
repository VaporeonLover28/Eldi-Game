extends Control

@onready var pipe_grid: GridContainer = $pipe_grid

@onready var minigame_handler = $"../../../"
@onready var minigame_window = $"../../"

@onready var long_pipe_texture = preload("res://Art/canoreto.png")
@onready var curved_pipe_texture = preload("res://Art/canocurvo.png")
@onready var plus_pipe_texture = preload("res://Art/canoplus.png")
@onready var exit_pipe_texture = preload("res://Art/canoentrada.png")

@onready var exit_node: Control = $ExitNode
@onready var pipe_sprite: TextureRect = $ExitNode/exit_pipe
@onready var exit_node_2: Control = $ExitNode2
@onready var pipe_sprite2: TextureRect = $ExitNode2/exit_pipe

var rng = RandomNumberGenerator.new()

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
	
	#0 = J
	#90 = L
	#180 = r
	#270 = 7
	[
	["CC", null], ["CR", null], ["CC", 180], ["CC", 0], \
	["CC", null], ["CR", null], ["CC", 90], ["CC", 270], \
	["CC", 180], ["CR", 0], ["CR", 0], ["CC", 0], \
	["CC", 90], ["CR", 0], ["CR", 0], ["CR", 0]
	],
	
	[
	["CC", 180], ["CR", 0], ["CR", 0], ["CR", 0], \
	["CC", 90], ["CC", 270], ["CC", null], ["CC", null], \
	["CC", null], ["CR", 90], ["CR", null], ["CC", null], \
	["CC", null], ["CC", 90], ["CR", 0], ["CR", 0]
	],
	
	[
	["CC", 180], ["CR", 0], ["CR", 0], ["CC", 270], \
	["CC", 0], ["CC", 180], ["CC", 270], ["CR", 90], \
	["CC", 180], ["CC", 0], ["CC", 90], ["CC", 0], \
	["CC", 0], ["CR", null], ["CR", null], ["CC", null]
	],
	
	[
	["CC", 90], ["CC", 270], ["CR", null], ["CC", 180], \
	["CC", 180], ["CC", 0], ["CC", 180], ["CC", 0], \
	["CC", 90], ["CC", 270], ["CC", 90], ["CC", 270], \
	["CC", null], ["CC", 90], ["CR", 0], ["CC", 0]
	],
	
	[
	["CC", 180], ["CC", 270], ["CR", null], ["CC", null], \
	["CR", 90], ["CC", 90], ["CC", 270], ["CC", null], \
	["CR", 90], ["CC", null], ["CC", 90], ["CC", 270], \
	["CR", 90], ["CR", null], ["CC", 180], ["CC", 0]
	],
	
	[
	["CR", 0], ["CR", 0], ["CR", 0], ["CC", 270], \
	["CC", 180], ["CR", 0], ["CR", 0], ["CC", 0], \
	["CC", 90], ["CR", 0], ["CR", 0], ["CC", 270], \
	["CR", 0], ["CR", 0], ["CR", 0], ["CC", 0]
	],
]

@onready var exit_list: Array = [
	#decides where exits are
	#begins at up-left
	#spins clockwise
	#match exit array position with answer array position
	[
	false, false, false, true, \
	false, false, false, true, \
	false, false, false, false, \
	false, false, false, false
	],
	
	[
	false, false, false, false, \
	true, false, false, true, \
	false, false, false, false, \
	false, false, false, false
	],
	
	[
	false, false, false, false, \
	false, false, false, false, \
	false, false, false, false, \
	true, false, true, false
	],
	
	[
	true, false, false, false, \
	true, false, false, false, \
	false, false, false, false, \
	false, false, false, false
	],
	
	[
	false, false, false, false, \
	false, false, false, false, \
	false, true, false, true, \
	false, false, false, false
	],
	
	[
	false, false, false, false, \
	false, false, false, false, \
	false, false, false, false, \
	true, false, false, true
	],
]

var correct_response_picker : int
var current_correct_response : Array
var current_exit: Array 

func _ready() -> void:
	correct_response_picker = rng.randi_range(0, correct_response_list.size() - 1)
	print("crp: " + str(correct_response_picker))
	current_correct_response = correct_response_list[correct_response_picker]
	current_exit = exit_list[correct_response_picker]
	#for loop to decide
	for item in pipe_grid.get_child_count():
		match current_correct_response.get(item).get(0):
			"CR":
				pipe_grid.get_child(item).get_child(0).texture_normal = long_pipe_texture
			"CC":
				pipe_grid.get_child(item).get_child(0).texture_normal = curved_pipe_texture
			"CM":
				pipe_grid.get_child(item).get_child(0).texture_normal = plus_pipe_texture
		pipe_grid.get_child(item).get_child(0).minigame_start()
	
	var exit_1 = null
	var exit_2 = null
	
	for exits in current_exit.size():
		if current_exit.get(exits) == true:
			if exit_1 == null:
				exit_1 = exits
				print("exit 1 = " + str(exit_1))
			else:
				exit_2 = exits
				print("exit 2 = " + str(exit_2))
	
	match exit_1:
		0:
			pipe_sprite.position = Vector2(0, -192)
			pipe_sprite.rotation = deg_to_rad(0)
		1:
			pipe_sprite.position = Vector2(0, -128)
			pipe_sprite.rotation = deg_to_rad(0)
		2:
			pipe_sprite.position = Vector2(0, -64)
			pipe_sprite.rotation = deg_to_rad(0)
		3:
			pipe_sprite.position = Vector2(0, -0)
			pipe_sprite.rotation = deg_to_rad(0)
		4:
			pipe_sprite.position = Vector2(-48, 48)
			pipe_sprite.rotation = deg_to_rad(90)
		5:
			pipe_sprite.position = Vector2(-112, 48)
			pipe_sprite.rotation = deg_to_rad(90)
		6:
			pipe_sprite.position = Vector2(-176, 48)
			pipe_sprite.rotation = deg_to_rad(90)
		7:
			pipe_sprite.position = Vector2(-240, 48)
			pipe_sprite.rotation = deg_to_rad(90)
		8:
			pipe_sprite.position = Vector2(-288, 0)
			pipe_sprite.rotation = deg_to_rad(180)
		9:
			pipe_sprite.position = Vector2(-288, -64)
			pipe_sprite.rotation = deg_to_rad(180)
		10:
			pipe_sprite.position = Vector2(-288, -128)
			pipe_sprite.rotation = deg_to_rad(180)
		11:
			pipe_sprite.position = Vector2(-288, -192)
			pipe_sprite.rotation = deg_to_rad(180)
		12:
			pipe_sprite.position = Vector2(-240, -240)
			pipe_sprite.rotation = deg_to_rad(270)
		13:
			pipe_sprite.position = Vector2(-176, -240)
			pipe_sprite.rotation = deg_to_rad(270)
		14:
			pipe_sprite.position = Vector2(-112, -240)
			pipe_sprite.rotation = deg_to_rad(270)
		15:
			pipe_sprite.position = Vector2(-48, -240)
			pipe_sprite.rotation = deg_to_rad(270)
	
	match exit_2:
		0:
			pipe_sprite2.position = Vector2(0, -192)
			pipe_sprite2.rotation = deg_to_rad(0)
		1:
			pipe_sprite2.position = Vector2(0, -128)
			pipe_sprite2.rotation = deg_to_rad(0)
		2:
			pipe_sprite2.position = Vector2(0, -64)
			pipe_sprite2.rotation = deg_to_rad(0)
		3:
			pipe_sprite2.position = Vector2(0, -0)
			pipe_sprite2.rotation = deg_to_rad(0)
		4:
			pipe_sprite2.position = Vector2(-48, 48)
			pipe_sprite2.rotation = deg_to_rad(90)
		5:
			pipe_sprite2.position = Vector2(-112, 48)
			pipe_sprite2.rotation = deg_to_rad(90)
		6:
			pipe_sprite2.position = Vector2(-176, 48)
			pipe_sprite2.rotation = deg_to_rad(90)
		7:
			pipe_sprite2.position = Vector2(-240, 48)
			pipe_sprite2.rotation = deg_to_rad(90)
		8:
			pipe_sprite2.position = Vector2(-288, 0)
			pipe_sprite2.rotation = deg_to_rad(180)
		9:
			pipe_sprite2.position = Vector2(-288, -64)
			pipe_sprite2.rotation = deg_to_rad(180)
		10:
			pipe_sprite2.position = Vector2(-288, -128)
			pipe_sprite2.rotation = deg_to_rad(180)
		11:
			pipe_sprite2.position = Vector2(-288, -192)
			pipe_sprite2.rotation = deg_to_rad(180)
		12:
			pipe_sprite2.position = Vector2(-240, -240)
			pipe_sprite2.rotation = deg_to_rad(270)
		13:
			pipe_sprite2.position = Vector2(-176, -240)
			pipe_sprite2.rotation = deg_to_rad(270)
		14:
			pipe_sprite2.position = Vector2(-112, -240)
			pipe_sprite2.rotation = deg_to_rad(270)
		15:
			pipe_sprite2.position = Vector2(-48, -240)
			pipe_sprite2.rotation = deg_to_rad(270)

func _physics_process(delta: float) -> void:
	
	#for loop that check every frame for the correct answer decide by 
	for item in range(pipe_grid.get_child_count()):
		if(current_correct_response.get(item).get(1) == null or  \
		(current_correct_response.get(item).get(1) == \
		pipe_grid.get_child(item).get_child(0).rotation_degrees)):
			pass
		else:
			return
	minigame_handler.minigame_result.emit(true, minigame_window)
	
	#if checar_cano_reto() == true
