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
	new_config.set_value("Globalvarible","money", game.money)
	new_config.set_value("Globalvarible","upgrades", [game.amountposters,\
	game.amountlightbulbs,\
	game.amountstrikes,\
	game.amountfilters])
	new_config.save("user://SaveFile.cfg")
	
func _load_game():
	pass
	
func _exit_tree() -> void:
	print("close")
	_save_game()
