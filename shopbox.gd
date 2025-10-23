extends HBoxContainer

var cursor

func _on_mouserecon_area_entered(area: Area2D) -> void:
	if area.name == "mouseclick":
		cursor = area.get_parent()

func _on_mouserecon_area_exited(area: Area2D) -> void:
	if area.name == "mouseclick":
		cursor.
