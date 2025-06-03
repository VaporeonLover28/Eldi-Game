extends TextureButton

enum { zero, nine_zero, one_eight_zero, two_seven_zero}
var rotation_state = zero
var cano_reto_path = "res://Art/canoreto.png"
var cano_curvo_path = "res://Art/canocurvo.png"

func minigame_start() -> void:
	var enum_translation = [zero, nine_zero, one_eight_zero, two_seven_zero]
	if self.texture_normal.resource_path == cano_reto_path:
		var initial_rot_for_enum = randf_range(0, 1)
		rotation_state = enum_translation[initial_rot_for_enum]
	if self.texture_normal.resource_path == cano_curvo_path:
		var initial_rot_for_enum = randf_range(0, 3)
		rotation_state = enum_translation[initial_rot_for_enum]
	print(rotation_state)
	_on_pipe_pressed()

func _on_pipe_pressed() -> void:
	if self.texture_normal.resource_path == cano_reto_path:
		match rotation_state:
			zero:
				rotation_state = nine_zero
				self.rotation_degrees = 90
			nine_zero:
				rotation_state = zero
				self.rotation_degrees = 0
	if self.texture_normal.resource_path == cano_curvo_path:
		match rotation_state:
			zero:
				#going 90°
				rotation_state = nine_zero
				self.rotation_degrees = 90
			nine_zero:
				#going 180°
				rotation_state = one_eight_zero
				self.rotation_degrees = 180
			one_eight_zero:
				#going 270°
				rotation_state = two_seven_zero
				self.rotation_degrees = 270
			two_seven_zero:
				#going 0°
				rotation_state = zero
				self.rotation_degrees = 0
