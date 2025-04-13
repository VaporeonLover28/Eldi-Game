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

#makes the prices grow
func upscaleprice(shopbox):
	idleitemlist[shopbox.upgrade_arraypos].Price = round(idleitemlist[shopbox.upgrade_arraypos].Price * 1.16666666666)

#when adding new item:
#add new equation with item array pos 
#item.moneyitgivesyou * item amount
#repeat for all items
func _on_givemoney_timeout() -> void:
	money += (idleitemlist[0].Income * amountposters) + \
	(idleitemlist[1].Income * amountlightbulbs) + \
	(idleitemlist[2].Income * amountstrikes) + \
	(idleitemlist[3].Income * amountfilters)
