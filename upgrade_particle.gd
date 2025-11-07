extends GPUParticles2D

@export var game : Node2D
@export_enum("Item", "Rating") var condition
@export_enum("Posters", "Lightbulbs", "Strikes", "Filters", "Plants") var req_item
@export var required_amount : int
var has_animated : bool = false

func update():
	##if node hasn't animated yet
	if !has_animated:
		##condition is item
		if condition == 0:
			##if enough of item
			if required_amount == game.idleitemlist[req_item]:
				##animate
				emitting = true
				get_parent().animate()
		##condition is rating
		else:
			##if rating is enough
			if required_amount >= game.rating:
				##animate
				emitting = true
				get_parent().animate()
