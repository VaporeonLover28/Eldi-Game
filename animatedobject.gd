extends Sprite2D; class_name AnimatedObject

@export_enum("Change", "Appear") var update_type

func _ready():
	if update_type == 1:
		visible = false

func animate():
	if update_type == 1:
		visible = true
