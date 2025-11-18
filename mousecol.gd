extends Area2D

@export var mouse : Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
	
	if Input.is_action_just_pressed("click"):
		if has_overlapping_areas():
				for minigame in get_overlapping_areas():
					if minigame is Prompt:
						minigame.open_anim()
