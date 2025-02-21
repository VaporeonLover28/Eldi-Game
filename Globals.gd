extends Node

#var moneytest : float
#
#@export var testidleitemlist : Array[Upgrade_resource]
#
##func assignbutton(button):
	##get_node("res://testing.tscn").get_child(str_to_var(button)).text = "Buy " + str(testidleitemlist[button].Name) + " for $" + str(testidleitemlist[button].Price)
