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
@onready var money : int = 5000000
@onready var money_stacked: int = 0
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

func _ready() -> void:
	var load_data = SaveScript.new_config.load("user://SaveFile.cfg")
	if load_data == OK and SaveScript.new_config.get_value("Globalvaribles", "last_date") != 0:
		money = SaveScript.new_config.get_value("Globalvaribles", "money")
		rating = SaveScript.new_config.new_config.get_value("Globalvaribles", "rating")
		amountposters = SaveScript.new_config.get_value("Globalvaribles", "upgrades")[0]
		amountlightbulbs = SaveScript.new_config.get_value("Globalvaribles", "upgrades")[1]
		amountstrikes = SaveScript.new_config.get_value("Globalvaribles", "upgrades")[2]
		amountfilters = SaveScript.new_config.get_value("Globalvaribles", "upgrades")[3]
		calculate_moneypers()
		update_rating()
		var time_diference = (Time.get_unix_time_from_system() - SaveScript.new_config.get_value("Globalvaribles", "last_date"))
		money_stacked = time_diference * moneypers
		$CanvasLayer/Comeback_popup.visible = true
		$CanvasLayer/Comeback_popup/Label.text = "You got back! Last time you played was " +  str(snappedf(time_diference/3600, 0.01))\
		+ " hours ago. You have generated " + str(money_stacked) + " money."
		SaveScript.new_config.set_value("Globalvaribles", "last_date", 0)
		SaveScript.new_config.save("user://SaveFile.cfg")
		
	elif load_data == OK and SaveScript.new_config.get_value("Globalvaribles", "last_date") == 0:
		money = SaveScript.new_config.get_value("Globalvaribles", "money")
		rating = SaveScript.new_config.new_config.get_value("Globalvaribles", "rating")
		amountposters = SaveScript.new_config.get_value("Globalvaribles", "upgrades")[0]
		amountlightbulbs = SaveScript.new_config.get_value("Globalvaribles", "upgrades")[1]
		amountstrikes = SaveScript.new_config.get_value("Globalvaribles", "upgrades")[2]
		amountfilters = SaveScript.new_config.get_value("Globalvaribles", "upgrades")[3]
		calculate_moneypers()
		update_rating()
		$CanvasLayer/Comeback_popup.visible = true
		$CanvasLayer/Comeback_popup/Label.text = "Oooppss! You didn't see to have saved last time you played. Be more careful nextime."
		SaveScript.new_config.set_value("Globalvaribles", "last_date", 0)
		SaveScript.new_config.save("user://SaveFile.cfg")
		
	else:
		print("save has failed")
	
func _hide_comeback_popup():
	print(str(money_stacked))
	money += money_stacked
	money_stacked = 0
	$CanvasLayer/Comeback_popup.visible = false
	
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

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("create minigame"):
		SaveScript.save_signal.emit()
