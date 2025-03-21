extends Label

#when adding new item:
#add new equation with its income
func _process(delta: float) -> void:
	text = "Income: $" + str(\
	($"../../..".amountposters * $"../../..".idleitemlist[0].Income)\
	 + ($"../../..".amountlightbulbs * $"../../..".idleitemlist[1].Income)\
	 + ($"../../..".amountstrikes * $"../../..".idleitemlist[2].Income)\
	 + ($"../../..".amountfilters * $"../../..".idleitemlist[3].Income)) + "/s"
