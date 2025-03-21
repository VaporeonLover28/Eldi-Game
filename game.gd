extends Node2D

var startmoneygiven = false

#variable for money system
var money : int
var rating : float

#declaring item shop
#when adding item: click node on inspector
#and add new element with parameters
@export var idleitemlist : Array[Upgrade_resource]
@export var taskitemlist : Array[Upgrade_resource]

#probably a shitty way to know how many of each upgrade player has
#when adding item: add new variable with name
var amountposters = 0
var amountlightbulbs = 0
var amountstrikes = 0
var amountfilters = 0

func _ready() -> void:
	if startmoneygiven == false:
		money = 5
		startmoneygiven = true

#changing the text of each button
func assignvalues(object, type):
	if type == "button":
		if object.get_parent().upgrade_type == "idle":
			object.get_child(0).text = ("$" + str(idleitemlist[object.get_parent().upgrade_arraypos].Price))
	else:
		object.text = (str(idleitemlist[object.get_parent().upgrade_arraypos].Name)\
		 + "\n $" + str(idleitemlist[object.get_parent().upgrade_arraypos].Income)\
		 + "/s\nNR:" + str(idleitemlist[object.get_parent().upgrade_arraypos].rating))


##makes the prices grow
#func upscaleprice(button):
	#testidleitemlist[str_to_var(button.name)].Price = floor(testidleitemlist[str_to_var(button.name)].Price * 1.16666666666)
#
#func _on_givemoney_timeout() -> void:
	#moneytest += (testidleitemlist[0].Income * amounttestitem1) + (testidleitemlist[1].Income * amounttestitem2) + (testidleitemlist[2].Income * amounttestitem3) + (testidleitemlist[3].Income * amounttestitem4) + (testidleitemlist[4].Income * amounttestitem5) + (testidleitemlist[5].Income * amounttestitem6)
