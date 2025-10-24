extends Node2D

@export var FOLLOW_SPEED = 10.0
@onready var anim = $cursor_anim

@onready var desc: Label = $desc/MarginContainer/desc_label

var current_item : Resource

func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	#position = position.lerp(mouse_pos, delta * FOLLOW_SPEED)
	position = mouse_pos
	
	if Input.is_action_pressed("click"):
		anim.play("Clicking")
	else:
		anim.play("Not_clicking")
	
	if current_item != null:
		set_description(current_item)
	elif desc.text != "":
			clear_description()

func set_description(resource : Resource):
	desc.get_parent().get_parent().visible = true
	desc.text = "This item gives " + str(resource.Income) + " money per second. It has a Nature Rating of " + str(resource.rating) +\
	".\n\n" + resource.description

func clear_description():
	desc.text = ""
	desc.get_parent().get_parent().visible = false
