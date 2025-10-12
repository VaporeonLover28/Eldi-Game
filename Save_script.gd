extends Node

@onready var game = get_parent().get_node("game")
var new_config: ConfigFile

var is_loading: bool = false

signal save_signal 

func _init() -> void:
	new_config = ConfigFile.new()
	save_signal.connect(_save_game)
	
func _save_game():
	print("save")
	new_config.set_value("Globalvaribles", "money", game.money)
	new_config.set_value("Globalvaribles", "rating", game.rating)
	new_config.set_value("Globalvaribles", "upgrades", [game.amountposters,\
	game.amountlightbulbs,\
	game.amountstrikes,\
	game.amountfilters])
	var progress_numbers: Array
	for item in game.minigame_progress_panel.v_box_container.get_children(true):
		if item is VBoxContainer:
				progress_numbers.append(item.get_node("Progress Minigame Bar").value)
	new_config.set_value("Globalvaribles", "minigame_progress", progress_numbers)
	new_config.set_value("Globalvaribles", "last_date", Time.get_unix_time_from_system())
	new_config.save("user://SaveFile.cfg")
	
func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST and get_parent().get_node_or_null("game") != null:
		_save_game()
	
