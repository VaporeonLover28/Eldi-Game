extends RigidBody2D

@onready var arc_line: Line2D = $"../Arc"
@onready var mouse_position
var pulling_distance = Vector2.ZERO
var was_throwed : bool = false
@onready var game_started := false
var times_thrown : int = 0

func _ready() -> void:
	await get_tree().create_timer(0.2).timeout
	game_started = true
	
func _physics_process(delta: float) -> void:
	if !was_throwed and game_started:
		if Input.is_action_pressed("click"):
			_calculating_throw(delta)
		
		if Input.is_action_just_released("click"):
			_throw()

func _calculating_throw(delta):
	pulling_distance = get_viewport().get_mouse_position() - self.global_position
	var calculated_velocity = pulling_distance * 0.75
	arc_line.clear_points()
	var inicial_point = self.global_position
	for item in 500:
		arc_line.add_point(inicial_point)
		calculated_velocity.y += 16 * delta
		inicial_point += calculated_velocity * delta
		if inicial_point.x > 340 or inicial_point.y > 340:
			break

func _throw():
	visible = true
	was_throwed = true
	self.freeze = false
	self.sleeping = false
	self.apply_impulse(pulling_distance * 6)
	times_thrown += 1
