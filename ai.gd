extends Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match name:
		"ai1":
			text = str($"..".amounttestitem1)
		"ai2":
			text = str($"..".amounttestitem2)
		"ai3":
			text = str($"..".amounttestitem3)
		"ai4":
			text = str($"..".amounttestitem4)
		"ai5":
			text = str($"..".amounttestitem5)
		"ai6":
			text = str($"..".amounttestitem6)
		
