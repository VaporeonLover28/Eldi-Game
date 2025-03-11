extends Control

@onready var anim = $AnimationPlayer

func _on_fadeinthresh_area_entered(area: Area2D) -> void:
	if area.name == "mouseclick":
		anim.play("slidein")

func _on_fadeoutthresh_area_exited(area: Area2D) -> void:
	if area.name == "mouseclick":
		anim.play("slideout")
