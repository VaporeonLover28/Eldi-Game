extends Button

#var assigneditem = Globals.testidleitemlist[str_to_var(self.name)]

func _ready() -> void:
	print(Globals.testidleitemlist)

#func _process(delta: float) -> void:
	#text = "Buy " + str(assigneditem.Name) + " for $" + str(assigneditem.Price)
