extends Label

#used to test color array
func _process(delta: float) -> void:
	text = "Color Size: " + str($"../groundarraytest".colorarray.size())
