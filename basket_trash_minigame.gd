extends Node2D

@onready var game = $"../../../../../"
@onready var minigame_handler = $"../../../../"
@onready var minigame_window = $"../../../"
@onready var throwable_trash = preload("res://throwable_trash.tscn")
@onready var winning_detection_area: Area2D = $"Winning Detection Area"
@onready var number_of_tries : int = 3

func _ready() -> void:
	if !game.minigame_started:
		game.minigame_started = true
	winning_detection_area.position = Vector2(360 + randf_range(0, 30), 72)
	$"Throwable Trash".position.x += randf_range(-15, 10)
	$gari.position.x = $"Throwable Trash".position.x - 15

func _on_winning_detection_area_body_entered(body: Node2D) -> void:
	minigame_handler.minigame_result.emit(true, minigame_window)

func _on_dead_zone_body_entered(body: Node2D) -> void:
	number_of_tries -= 1
	if number_of_tries == 0:
		minigame_handler.minigame_result.emit(false, minigame_window)
	body.queue_free()
	var throwable_trash_inst = throwable_trash.instantiate()
	throwable_trash_inst.position = Vector2(55, 248)
	throwable_trash_inst.freeze = true
	throwable_trash_inst.sleeping = true
	self.add_child(throwable_trash_inst)
	
