extends Sprite2D

var tween : Tween

func appear():
	visible = true
	var base_mod = modulate
	tween = create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "modulate", base_mod, 0.75).from(Color.WHITE)
