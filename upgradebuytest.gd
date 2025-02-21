extends Button

#update the text (on $testing)
func _ready() -> void:
	$"..".assignbutton(self)

#when pressed
func _on_pressed() -> void:
	#if money > price (buyable)
	if $"..".moneytest >= $"..".testidleitemlist[str_to_var(self.name)].Price:
		#spend money
		$"..".moneytest -= $"..".testidleitemlist[str_to_var(self.name)].Price
		#make price higher
		$"..".upscaleprice(self)
		#update button text
		$"..".assignbutton(self)
		#adding one of the upgrade to $testing vars
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
