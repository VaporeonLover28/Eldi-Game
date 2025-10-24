extends Control

@onready var panel = $PanelContainer

var tween = Tween
var tab_opened = false

func _on_fadeinthresh_area_entered(area: Area2D) -> void:
	if area.name == "mouseclick" and !tab_opened:
		tween = create_tween()
		tween.tween_property(panel, "position", Vector2(0, 0), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUART)
		tab_opened = true

func _on_fadeoutthresh_area_exited(area: Area2D) -> void:
	if area.name == "mouseclick" and tab_opened:
		tween = create_tween()
		tween.tween_property(panel, "position", Vector2(-167, 0), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUART)
		tab_opened = false
