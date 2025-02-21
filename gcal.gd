extends Label

#to test the ground cell array
func _process(delta: float) -> void:
	text = "Ground Cell Size: " + str($"../groundarraytest".groundcellarray[0].size())
