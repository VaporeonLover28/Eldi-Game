extends Node2D

var rng = RandomNumberGenerator.new()
#Declaring the array containing the ground cells
var groundcellarray = []
#Declaring the array containing the random picker for the cell colors
var colorarray = []
#To check if the array is finished appending the random integers
#(Color array size equals ground cell array size)
var color_equal_cell = false

func _ready() -> void:
	#Appending this node's children to the array
	#Using (get_children) unfortunately makes another array inside that one
	#Remember to use groundcellarray[0] for the base array
	#And groundcellarray[0[X]] for a specific object
	groundcellarray.append(get_children())

func _process(delta: float) -> void:
	#If the color array size is lesser than the cell array size
	#And it has not finished appending random values
	if colorarray.size() < groundcellarray[0].size() and color_equal_cell == false:
		#Append a random value between 0 and 1
		colorarray.append(round(rng.randf_range(0, 1)))
	else:
		#Finish appending random values
		color_equal_cell = true
	
	#If has finished appending values and the array isn't empty yet
	if color_equal_cell == true and colorarray.is_empty() == false:
		#Change the first cell in the array's color
		#Based on the first number in the color array
		#Delete both
		#Repeat
		
		#Sort the cells' colors based on the number, deletes number
		#TIER 1
		#gray: 080817
		#black: 06061a
		#TIER 2
		#yellow: d59b00
		#orange: a46b00
		#TIER 3
		#green: 089900
		#greener: 0ad100
		var colorsorter : String
		if colorarray.pop_front() == 0:
			colorsorter = "#089900"
		else:
			colorsorter = "#0ad100"
		
		#Changes the cell's color and deletes it
		groundcellarray[0].pop_front().color = colorsorter
