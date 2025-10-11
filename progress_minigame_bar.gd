extends ProgressBar

@export var upgrade_progress_level: float = 1

var tween : Tween

func _on_value_changed(new_value: float) -> void:
	print("oi")
	tween = create_tween()
	tween.tween_property(self, "value", new_value, 3).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
