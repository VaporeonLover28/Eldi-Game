extends ProgressBar

var tween : Tween

func tween_value(new_value):
	tween = create_tween()
	tween.tween_property(self, "value", new_value, 2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
