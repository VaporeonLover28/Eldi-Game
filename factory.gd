extends Node2D

@onready var game: Node2D = $"../.."
@onready var fabbrica: Sprite2D = $fabbrica
@onready var chamine: Sprite2D = $chamine
@onready var poster_1: Sprite2D = $poster1
@onready var poster_2: Sprite2D = $poster2
@onready var poster_3: Sprite2D = $poster3
@onready var poster_4: Sprite2D = $poster4

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if game.amountposters >= 1:
		if $poster1.visible == false:
			$poster1.visible = true
		if game.amountposters >= 2:
			if $poster2.visible == false:
				$poster2.visible = true
			if game.amountposters >= 3:
				if $poster3.visible == false:
					$poster3.visible = true
				if game.amountposters >= 4:
					if $poster4.visible == false:
						$poster4.visible = true
	
	$chamine.modulate.r = 1 - (game.amountfilters / 0.1)
	$chamine.modulate.b = 1 - (game.amountfilters / 0.1)
	
	$fabbrica.modulate.b = 1 - (game.amountlightbulbs / 0.1)
