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
		for item in v_box_container.get_children():
			if item is VBoxContainer:
				var new_progress_porcentage = (game.rating/item.get_node("Progress Minigame Bar").upgrade_progress_level) * 100
				if new_progress_porcentage > 100:
					new_progress_porcentage = 100
				if  new_progress_porcentage != item.get_node("Progress Minigame Bar").value:
					print("lau")
					item.get_node("Progress Minigame Bar")._on_value_changed(new_progress_porcentage)

func _on_fadeoutthresh_area_exited(area: Area2D) -> void:
	if area.name == "mouseclick" and tab_opened:
		anim.queue("shopslideout")
		size.x = 80
		tab_opened = false
