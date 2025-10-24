extends CanvasLayer

var tween : Tween

func _on_proceed_pressed() -> void:
	tween = create_tween()
	tween.tween_property(self, "offset", Vector2(0, -720), 0.75).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_BACK)
