extends PanelContainer

@onready var game = $"../.."

@onready var tween : Tween

func _ready() -> void:
	tween = create_tween()
	tween.tween_property(self, "position", Vector2(380, 150), 3.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)

func _hide_comeback_popup():
	tween = create_tween()
	tween.tween_property(self, "position", Vector2(380, 960), 3.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	game.money += game.money_stacked
	game.money_stacked = 0
