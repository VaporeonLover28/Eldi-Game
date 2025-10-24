extends Control

@export var item : Resource
var cursor

@onready var label_name: Label = $HBoxContainer/VBoxContainer/name
@onready var label_income: Label = $HBoxContainer/VBoxContainer/HBoxContainer/income
@onready var label_rating: Label = $HBoxContainer/VBoxContainer/HBoxContainer/rating

func _ready() -> void:
	print(item)
	label_name.text = item.Name
	label_income.text = "$" + str(item.Income) + "/s"
	label_rating.text = str(item.rating) + " NR"

func _on_mouserecon_area_entered(area: Area2D) -> void:
	if area.name == "mouseclick":
		cursor = area.get_parent()
		if cursor.current_item != item:
			cursor.current_item = item

func _on_mouserecon_area_exited(area: Area2D) -> void:
	if area.name == "mouseclick"and cursor.current_item == item:
		cursor.current_item = null
