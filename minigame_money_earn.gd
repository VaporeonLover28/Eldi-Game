extends Label

var velocity = 1

func _process(delta: float) -> void:
	
	position.y -= velocity
	modulate.a -= 0.03
	
	if modulate.a <= 0:
		queue_free()

func set_text2(step_money):
	text = "+$" + str(step_money)
	#print(text)
