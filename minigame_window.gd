extends SubViewportContainer

@onready var game = $"../../../"
@onready var minigame_handler = $"../"
@onready var minigame_chosen : Upgrade_resource
@onready var minigame_camera = preload("res://minigame_camera.tscn")
@onready var texture_button = $TextureButton


func _spawn_minigame():
	texture_button.visible = false
	#adding and setting minigame to the minigamewindow
	var minigame_inst = minigame_chosen.minigame_scene.instantiate()
	get_child(0).add_child(minigame_inst)
	#adding a camera to the minigame scene
	var minigame_camera_inst = minigame_camera.instantiate()
	get_child(0).get_child(0).add_child(minigame_camera_inst)
