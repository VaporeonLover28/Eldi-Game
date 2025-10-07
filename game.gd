extends Node2D

@onready var smoke: GPUParticles2D = $scene/factory/smoke
@onready var poster_1: Sprite2D = $scene/factory/poster1
@onready var poster_2: Sprite2D = $scene/factory/poster2
@onready var poster_3: Sprite2D = $scene/factory/poster3
@onready var poster_4: Sprite2D = $scene/factory/poster4
@onready var poster_5: Sprite2D = $scene/factory/poster5

var startmoneygiven = false
var minigame_started := false

#variable for money system
var money : int = 5000000
var rating : float = 0.0:
	set(value):
		if value > 100: 
			rating = 100
		else:
			rating = value
		update_rating()

var moneypers : int

#declaring item shop
#when adding item: click node on inspector
#and add new element with parameters
@export var idleitemlist : Array[Upgrade_resource]
@export var taskitemlist : Array[Upgrade_resource]
@export var unlocked_tasks : Array[Upgrade_resource]

#probably a shitty way to know how many of each upgrade player has
#when adding item: add new variable with name
var amountposters = 0:
	set(value):
		amountposters = value
		if value > 0 and !poster_1.visible:
			poster_1.appear()
		if value > 1 and !poster_2.visible:
			poster_2.appear()
		if value > 2 and !poster_3.visible:
			poster_3.appear()
		if value > 3 and !poster_4.visible:
			poster_4.appear()
		if value > 4 and !poster_5.visible:
			poster_5.appear()
var amountlightbulbs = 0
var amountstrikes = 0
var amountfilters = 0:
	set(value):
		amountfilters = value
		var array = PackedColorArray()
		var color_value = clamp(value / 5.0, 0.0, 1.0)
		var result_color = Color(0.241 + (1.0 - 0.241) * color_value, 0.241 + (1.0 - 0.241) * color_value, 0.241 + (1.0 - 0.241) * color_value)
		#print(result_color)
		array.append(result_color)
		smoke.texture.gradient.colors = array

func calculate_moneypers():
	moneypers = (idleitemlist[0].Income * amountposters) + \
	(idleitemlist[1].Income * amountlightbulbs) + \
	(idleitemlist[2].Income * amountstrikes) + \
	(idleitemlist[3].Income * amountfilters)
	$CanvasLayer/toppanel/incomelabel.text = "Income: $" + str(moneypers) + "/s"

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

func update_rating():
	if rating > 1 and unlocked_tasks.size() < 1:
		unlocked_tasks.append(load("res://Upgrades/Task/collection.tres"))
	if rating > 15 and unlocked_tasks.size() < 2:
		unlocked_tasks.append(load("res://Upgrades/Task/garbage men.tres"))
	if rating > 40 and unlocked_tasks.size() < 3:
		unlocked_tasks.append(load("res://Upgrades/Task/junk recycle.tres"))
	if rating > 60 and unlocked_tasks.size() < 4:
		unlocked_tasks.append(load("res://Upgrades/Task/water treat.tres"))

#when adding new item:
#add new equation with item array pos 
#item.moneyitgivesyou * item amount
#repeat for all items
func _on_givemoney_timeout() -> void:
	money += moneypers
