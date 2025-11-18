extends Control

@onready var panel: TabContainer = $TabContainer
@onready var v_box_container: VBoxContainer = $"TabContainer/teste 1/ScrollContainer/VBoxContainer"
@onready var game: Node2D = $"../.."

var tween : Tween
var tab_opened = false

func _on_fadeinthresh_area_entered(area: Area2D) -> void:
	if area.name == "mouseclick" and !tab_opened:
		tween = create_tween()
		tween.tween_property(panel, "position", Vector2(0, 36.0), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUART)
		tab_opened = true

func _on_fadeoutthresh_area_exited(area: Area2D) -> void:
	if area.name == "mouseclick" and tab_opened:
		tween = create_tween()
		tween.tween_property(panel, "position", Vector2(-167, 36), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUART)
		tab_opened = false

func update_bars():
	for container in v_box_container.get_children(true):
			if container is VBoxContainer:
				container.get_child(1).tween_value(game.rating)
