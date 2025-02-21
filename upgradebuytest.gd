extends Button

#var assigneditem = Globals.testidleitemlist[str_to_var(self.name)]

func _ready() -> void:
	$"..".assignbutton(self)

func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	if $"..".moneytest >= $"..".testidleitemlist[str_to_var(self.name)].Price:
		$"..".moneytest -= $"..".testidleitemlist[str_to_var(self.name)].Price
		$"..".upscaleprice(self)
		$"..".assignbutton(self)
		
		match name:
			"0":
				$"..".amounttestitem1 += 1
			"1":
				$"..".amounttestitem2 += 1
			"2":
				$"..".amounttestitem3 += 1
			"3":
				$"..".amounttestitem4 += 1
			"4":
				$"..".amounttestitem5 += 1
			"5":
				$"..".amounttestitem6 += 1
