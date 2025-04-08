extends Node2D

@onready var lixo = preload("res://collectabletrash.tscn")
@onready var collectedtrash = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_spawn_trash_timeout() -> void:
	var lixo_inst = lixo.instantiate()
	lixo_inst.position = Vector2(randf_range(0, 1280), randf_range(0, 720))
	add_child(lixo_inst)
