extends Label

#amount item
#shows how many of each upgrade player has (for testing)
#for testing, so just put the new item dumbass
func _process(delta: float) -> void:
	match name:
		"ai1":
			text = str($"..".amounttestitem1)
		"ai2":
			text = str($"..".amounttestitem2)
		"ai3":
			text = str($"..".amounttestitem3)
		"ai4":
			text = str($"..".amounttestitem4)
		"ai5":
			text = str($"..".amounttestitem5)
		"ai6":
			text = str($"..".amounttestitem6)
		
