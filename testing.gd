extends Node2D

var moneytest : float

@export var testidleitemlist : Array[Upgrade_resource]
var amounttestitem1 = 0
var amounttestitem2 = 0
var amounttestitem3 = 0
var amounttestitem4 = 0
var amounttestitem5 = 0
var amounttestitem6 = 0

func assignbutton(button):
	button.text = "Buy " + str(testidleitemlist[str_to_var(button.name)].Name) + " for $" + str(testidleitemlist[str_to_var(button.name)].Price)

func _on_moneygen_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			moneytest += 1 + (testidleitemlist[0].Income * amounttestitem1) + (testidleitemlist[1].Income * amounttestitem2) + (testidleitemlist[2].Income * amounttestitem3) + (testidleitemlist[3].Income * amounttestitem4) + (testidleitemlist[4].Income * amounttestitem5) + (testidleitemlist[5].Income * amounttestitem6)

func upscaleprice(button):
	testidleitemlist[str_to_var(button.name)].Price = round(testidleitemlist[str_to_var(button.name)].Price * 1.25 + 1)
