extends Node2D

@onready var game = $"../../../../../"
@onready var minigame_handler = $"../../../"
@onready var minigame_window = $"../../"
@onready var throwable_trash = preload("res://throwable_trash.tscn")
@onready var winning_detection_area: Area2D = $"Winning Detection Area"
@onready var number_of_tries : int = 3


func _ready() -> void:
	winning_detection_area.position = Vector2(316, randi_range(0 , 250))

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
	
