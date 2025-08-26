extends Node2D

@onready var game: Node2D = $"../.."
@onready var fabbrica: Sprite2D = $fabbrica
@onready var chamine: Sprite2D = $chamine
@onready var poster_1: Sprite2D = $poster1
@onready var poster_2: Sprite2D = $poster2
@onready var poster_3: Sprite2D = $poster3
@onready var poster_4: Sprite2D = $poster4
@onready var poster_5: Sprite2D = $poster5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	poster_1.visible = false if game.amountposters == 0 else true
	poster_2.visible = false if game.amountposters <= 1 else true
	poster_3.visible = false if game.amountposters <= 2 else true
	poster_4.visible = false if game.amountposters <= 3 else true
	poster_5.visible = false if game.amountposters <= 4 else true
	
	$chamine.modulate.r = 1 - (game.amountfilters * 0.1)
	$chamine.modulate.b = 1 - (game.amountfilters * 0.1)
	
	$fabbrica.modulate.b = 1 -(game.amountlightbulbs * 0.1)
