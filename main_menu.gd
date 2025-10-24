extends Control

@onready var options_menu = $Options_Menu
@onready var margincontainer = $MarginContainer

func _ready() -> void:
	options_menu.visible = false

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")

func _on_options_button_pressed() -> void:
	margincontainer.visible = false
	options_menu.visible = true
	
func _on_exit_options_menu() -> void:
	margincontainer.visible = true
	options_menu.visible = false

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_window_mode_selected(index: int) -> void:
	match index:
		0: #FullScreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1: #Window Mode
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2: #Borderless Window
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		3: #Borderless FullScreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)

func _on_resolution_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1152, 648))
		1:
			DisplayServer.window_set_size(Vector2i(1280, 720))
		2:
			DisplayServer.window_set_size(Vector2i(1920, 1080))
