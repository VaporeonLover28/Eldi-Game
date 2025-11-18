extends Area2D; class_name Prompt

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var window = preload("res://minigame_window.tscn")
@onready var timeout: Timer = $MinigameTimeout

var minigame : Upgrade_resource
var origin : float = -50000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	origin = position.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if origin != -50000:
		var time = Time.get_ticks_msec() / 1000.0
		position.y = origin + sin(time * 0.7 * PI) * 20

func open_anim():
	if origin != -50000:
		origin = -50000
		anim.play("open")
		await get_tree().create_timer(1.25).timeout
		var inst = window.instantiate()
		inst.minigame_chosen = minigame
		add_child(inst)
		inst.spawn_minigame()
