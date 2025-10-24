extends Control

@export var item : Resource
var cursor

@onready var game = $"../../../../../../"
@onready var label_name: Label = $HBoxContainer/VBoxContainer/name
@onready var label_income: Label = $HBoxContainer/VBoxContainer/HBoxContainer/income
@onready var label_rating: Label = $HBoxContainer/VBoxContainer/HBoxContainer/rating
@onready var buy: TextureButton = $Control/buy

func _ready() -> void:
	label_name.text = item.Name
	label_income.text = "$" + str(item.Income) + "/s"
	label_rating.text = str(item.rating) + " NR"
	update_price()

func update_price():
	buy.get_child(0).text = "$" + str(item.Price)

func _on_mouserecon_area_entered(area: Area2D) -> void:
	if area.name == "mouseclick":
		cursor = area.get_parent()
		if cursor.current_item != item:
			cursor.current_item = item

func _on_mouserecon_area_exited(area: Area2D) -> void:
	if area.name == "mouseclick"and cursor.current_item == item:
		cursor.current_item = null

func _on_buy_pressed() -> void:
	game.buy(item)
	await get_tree().process_frame
	update_price()
