extends SubViewportContainer

@onready var game = $"../../../"
@onready var minigame_handler = $"../"
@onready var minigame_chosen : Upgrade_resource
@onready var texture_button = $TextureButton

func _spawn_minigame():
	position.x -= 60
	position.y -= 200
	texture_button.queue_free()
	#configuring the subviewport
	var minigame_subviewport_inst = SubViewport.new()
	minigame_subviewport_inst.size = minigame_chosen.minigame_window_size
	#adding the minigame to the subviewport
	var minigame_inst = minigame_chosen.minigame_scene.instantiate()
	minigame_subviewport_inst.add_child(minigame_inst)
	#adding camera to the minigame
	var minigame_camera_inst = Camera2D.new()
	minigame_camera_inst.limit_left = 0
	minigame_camera_inst.limit_top = 0
	minigame_inst.add_child(minigame_camera_inst)
	#adding the minigame proprely to the window
	add_child(minigame_subviewport_inst)
