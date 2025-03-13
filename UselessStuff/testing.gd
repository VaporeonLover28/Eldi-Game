extends Node2D

var startmoneygiven = false

#test variable for money system
var moneytest : int

#declaring item shop
#when adding item: click node and add new element with parameters
@export var testidleitemlist : Array[Upgrade_resource]

#probably a shitty way to know how many of each upgrade player has
#when adding item: add new variable with name
var amounttestitem1 = 0
var amounttestitem2 = 0
var amounttestitem3 = 0
var amounttestitem4 = 0
var amounttestitem5 = 0
var amounttestitem6 = 0

func _ready() -> void:
	if startmoneygiven == false:
		moneytest = 5
		startmoneygiven = true

#changing the text of each button
func assignbutton(button):
	button.text = "Buy " + str(testidleitemlist[str_to_var(button.name)].Name) + " for $" + str(testidleitemlist[str_to_var(button.name)].Price)

#giving money when area clicked with a probably uneccessarily long line
#when adding item: add a new operation with array index and amount var
func _on_moneygen_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			moneytest += (testidleitemlist[0].Income * amounttestitem1) + (testidleitemlist[1].Income * amounttestitem2) + (testidleitemlist[2].Income * amounttestitem3) + (testidleitemlist[3].Income * amounttestitem4) + (testidleitemlist[4].Income * amounttestitem5) + (testidleitemlist[5].Income * amounttestitem6)

#makes the prices grow
func upscaleprice(button):
	testidleitemlist[str_to_var(button.name)].Price = floor(testidleitemlist[str_to_var(button.name)].Price * 1.16666666666)

func _on_givemoney_timeout() -> void:
	moneytest += (testidleitemlist[0].Income * amounttestitem1) + (testidleitemlist[1].Income * amounttestitem2) + (testidleitemlist[2].Income * amounttestitem3) + (testidleitemlist[3].Income * amounttestitem4) + (testidleitemlist[4].Income * amounttestitem5) + (testidleitemlist[5].Income * amounttestitem6)
