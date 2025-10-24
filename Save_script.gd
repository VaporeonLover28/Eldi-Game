extends Node
 
var new_config: ConfigFile

var is_loading: bool = false

signal save_signal 

func _init() -> void:
	new_config = ConfigFile.new()
	save_signal.connect(_save_game)
	
func _save_game():
	new_config.set_value("Globalvaribles", "money", get_parent().get_node("game").money)
	new_config.set_value("Globalvaribles", "rating", get_parent().get_node("game").rating)
	new_config.set_value("Globalvaribles", "upgrades", [get_parent().get_node("game").amountposters,\
	get_parent().get_node("game").amountlightbulbs,\
	get_parent().get_node("game").amountstrikes,\
	get_parent().get_node("game").amountfilters])
	var progress_numbers: Array
	for item in get_parent().get_node("game").minigame_progress_panel.v_box_container.get_children(true):
		if item is VBoxContainer:
				progress_numbers.append(item.get_node("Progress Minigame Bar").value)
	new_config.set_value("Globalvaribles", "minigame_progress", progress_numbers)
	new_config.set_value("Globalvaribles", "last_date", Time.get_unix_time_from_system())
	new_config.save("user://SaveFile.cfg")
	print("save")

func _delete_save():
	print("try to delete")
	print(DirAccess.dir_exists_absolute("user://SaveFile.cfg"))
	if DirAccess.dir_exists_absolute("user://SaveFile.cfg") != null:
		print("delete")
		DirAccess.remove_absolute("user://SaveFile.cfg")

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST and get_parent().get_node_or_null("game") != null:
		_save_game()
