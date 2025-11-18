extends SubViewportContainer

@onready var game = $"../../../"
@onready var minigame_chosen : Upgrade_resource

var tween : Tween

func spawn_minigame():
	#configuring the subviewport
	var minigame_subviewport_inst = SubViewport.new()
	
	minigame_subviewport_inst.size = Vector2(1, 1)
	#adding the minigame to the subviewport
	var minigame_inst = minigame_chosen.minigame_scene.instantiate()
	
	minigame_subviewport_inst.add_child(minigame_inst)
	#adding camera to the minigame
	var minigame_camera_inst = Camera2D.new()
	minigame_camera_inst.limit_left = 0
	minigame_camera_inst.limit_top = 0
	minigame_inst.add_child(minigame_camera_inst)
	minigame_camera_inst.position = Vector2(160, 160)
	#adding the minigame properly to the window
	add_child(minigame_subviewport_inst)
	tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_parallel()
	tween.tween_property(self, "position", Vector2(-152, -253), 1)
	tween.tween_property(minigame_subviewport_inst, "size", Vector2i(320, 320), 1)
	tween.tween_property(minigame_camera_inst, "position", Vector2.ZERO, 1)
	#tween.tween_callback(func():print(minigame_subviewport_inst.size))
