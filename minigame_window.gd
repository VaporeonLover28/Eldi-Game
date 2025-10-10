extends SubViewportContainer

@onready var game = $"../../../"
@onready var minigame_handler = $"../"
@onready var minigame_chosen : Upgrade_resource
@onready var texture_button = $TextureButton
@onready var color_rect: ColorRect = $Control/ColorRect

var tween : Tween

func _spawn_minigame():
	position.x -= 32
	position.y -= 64
	texture_button.queue_free()
	#configuring the subviewport
	var minigame_subviewport_inst = SubViewport.new()
	
	minigame_subviewport_inst.size = Vector2(10, 10)
	#minigame_subviewport_inst.size = minigame_chosen.minigame_window_size
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
	tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_parallel()
	tween.tween_property(self, "position", position - Vector2(80, 80), 1)
	tween.tween_property(minigame_subviewport_inst, "size", minigame_chosen.minigame_window_size, 1)
	tween.tween_callback(func():print(minigame_subviewport_inst.size))
