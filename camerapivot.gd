extends Node3D

var camera_orbit = true

func _process(delta: float) -> void:
	if camera_orbit == true:
		rotation.y += deg_to_rad(0.1)
