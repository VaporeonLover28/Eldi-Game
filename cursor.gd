extends Node2D

@export var FOLLOW_SPEED = 10.0
@onready var anim = $cursor_anim
func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	position = position.lerp(mouse_pos, delta * FOLLOW_SPEED)
	
	if Input.is_action_pressed("click"):
		anim.play("Clicking")
	else:
		anim.play("Not_clicking")
