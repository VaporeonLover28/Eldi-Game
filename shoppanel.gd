extends Control

@onready var anim = $AnimationPlayer

var fadein_playing = false
var fadeout_playing = false
var fadein_queued = false
var fadeout_queued = false

func _on_fadeinthresh_area_entered(area: Area2D) -> void:
	if area.name == "mouseclick" and fadeout_playing == false:
		fadein_playing = true
		anim.play("shopslidein")
	elif area.name == "mouseclick" and fadeout_playing == true:
		fadein_queued = true

func _on_fadeoutthresh_area_exited(area: Area2D) -> void:
	if area.name == "mouseclick" and fadein_playing == false:
		fadeout_playing = true
		anim.play("shopslidein")
	elif area.name == "mouseclick" and fadein_playing == true:
		fadeout_queued = true
