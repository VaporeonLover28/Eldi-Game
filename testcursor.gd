extends Node2D

const FOLLOW_SPEED = 9.0

func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	position = position.lerp(mouse_pos, delta * FOLLOW_SPEED)
