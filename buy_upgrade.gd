extends TextureButton; class_name UpgradeBuyer;

#When adding button/item: Add it's name, then type
#Add the .tres to the respective array
#Find its position in the array 
#Put the position in arraypos
@export var upgrade_name : String
@export var upgrade_arraypos : int
@export_enum("idle", "task") var upgrade_type : String

##update the text (on $testing)
#func _ready() -> void:
	#$game.assignbutton(self, "button")
#
##when pressed
#func _on_pressed() -> void:
	##if money > price (buyable)
	#if $"..".moneytest >= $"..".testidleitemlist[str_to_var(self.name)].Price:
		##spend money
		#$"..".moneytest -= $"..".testidleitemlist[str_to_var(self.name)].Price
		##make price higher
		#$"..".upscaleprice(self)
		##update button text
		#$"..".assignbutton(self)
		##adding one of the upgrade to $testing vars
		##when adding item: match name to add 1 to var
		#match name:
			#"0":
				#$"..".amounttestitem1 += 1
			#"1":
				#$"..".amounttestitem2 += 1
			#"2":
				#$"..".amounttestitem3 += 1
			#"3":
				#$"..".amounttestitem4 += 1
			#"4":
				#$"..".amounttestitem5 += 1
			#"5":
				#$"..".amounttestitem6 += 1
