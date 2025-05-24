extends TextureButton

enum { zero, nine_zero, one_eight_zero, two_seven_zero}
var rotation_state = zero


func _on_pipe_pressed() -> void:
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
