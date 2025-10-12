extends Control

@onready var anim = $AnimationPlayer
@onready var v_box_container: VBoxContainer = $"TabContainer/teste 1/ScrollContainer/VBoxContainer"
@onready var game: Node2D = $"../.."

var tab_opened = false

func _on_fadeinthresh_area_entered(area: Area2D) -> void:
	if area.name == "mouseclick" and !tab_opened:
		size.x = 300
		anim.play("shopslidein")
		tab_opened = true

func _on_fadeoutthresh_area_exited(area: Area2D) -> void:
	if area.name == "mouseclick" and tab_opened:
		anim.queue("shopslideout")
		size.x = 80
		tab_opened = false

func update_bars():
	for container in v_box_container.get_children(true):
			if container is VBoxContainer:
				container.get_child(1).tween_value(game.rating)
