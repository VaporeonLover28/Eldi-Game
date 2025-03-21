extends Node

#FOR CODE I THREW AWAY

#extends Node2D
#
#setting a fixed number of ground cells for each scene
#const test_scene_ground_cells = 64
#
#var rng = RandomNumberGenerator.new()
#var groundcellarray = []
#var colorarray = []
#
#func _ready() -> void:
	#adding all the ground cells to an array
	#groundcellarray.append(get_children())
	#resizing the color array to the size of ground cells for the scene
	#colorarray.resize(test_scene_ground_cells)
#
#func _process(delta: float) -> void:
	#if colorarray.size() < test_scene_ground_cells:
		#colorarray.append(1)
	#else:
		#print(colorarray)#
	
	
	
##giving money when area clicked with a probably uneccessarily long line
##when adding item: add a new operation with array index and amount var
#func _on_moneygen_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#if event is InputEventMouseButton and event.pressed:
		#if event.button_index == MOUSE_BUTTON_LEFT:
			#moneytest += (testidleitemlist[0].Income * amounttestitem1) + (testidleitemlist[1].Income * amounttestitem2) + (testidleitemlist[2].Income * amounttestitem3) + (testidleitemlist[3].Income * amounttestitem4) + (testidleitemlist[4].Income * amounttestitem5) + (testidleitemlist[5].Income * amounttestitem6)
