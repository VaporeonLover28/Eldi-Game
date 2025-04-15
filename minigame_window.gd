extends SubViewportContainer

@onready var game = $"../../../"
@onready var minigame_handler = $"../"
@onready var minigame_chosen : Upgrade_resource
@onready var texture_button = $TextureButton


func _spawn_minigame():
	texture_button.queue_free()
	var minigame_subviewport_inst = SubViewport.new()
	minigame_subviewport_inst.size = minigame_chosen.minigame_window_size
	add_child(minigame_subviewport_inst)
	#adding and setting minigame to the minigamewindow
	var minigame_inst = minigame_chosen.minigame_scene.instantiate()
	get_child(-1).add_child(minigame_inst)
	#adding a camera to the minigame scene
	var minigame_camera_inst = Camera2D.new()
	minigame_camera_inst.limit_left = 0
	minigame_camera_inst.limit_top = 0
	get_child(-1).get_child(0).add_child(minigame_camera_inst)
