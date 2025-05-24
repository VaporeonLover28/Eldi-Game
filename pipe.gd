extends TextureButton

enum { zero, nine_zero, one_eight_zero, two_seven_zero}
var rotation_state = zero


func _on_pipe_pressed() -> void:
	match rotation_state:
		zero:
			#going 90°
			rotation_state = nine_zero
			self.flip_v = true
			self.flip_h = false
		nine_zero:
			#going 180°
			rotation_state = one_eight_zero
			self.flip_v = false
			self.flip_h = true
		one_eight_zero:
			#going 270°
			rotation_state = two_seven_zero
			self.flip_v = true
			self.flip_h = true
		two_seven_zero:
			#going 0°
			rotation_state = zero
			self.flip_v = false
			self.flip_h = false
