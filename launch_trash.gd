extends Node2D

@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar
@onready var sprite_2d: Sprite2D = $Sprite2D
enum {up, down}
var motion_state = down
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match motion_state:
		0:
			sprite_2d
