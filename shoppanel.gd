extends Control

@onready var anim = $AnimationPlayer

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
