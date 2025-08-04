extends RigidBody2D

@onready var arc_line: Line2D = $"../Arc"
@onready var mouse_position
var pulling_distance
var dir

var was_throwed : bool = false

func _ready() -> void:
	freeze = true
	
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("click") and was_throwed == false:
		_calculating_throw(delta)
		
	if Input.is_action_just_released("click") and was_throwed == false:
		_throw()


func _calculating_throw(delta):
	pulling_distance = get_viewport().get_mouse_position() - self.global_position
	var calculated_velocity = pulling_distance * 0.75
	arc_line.clear_points()
	var inicial_point = self.global_position
	for item in 500:
		arc_line.add_point(inicial_point)
		calculated_velocity.y += 5 * delta
		inicial_point += calculated_velocity * delta
		if inicial_point.x > 340 or inicial_point.y > 340:
			break

func _throw():
	was_throwed = true
	freeze = false
	self.apply_impulse(pulling_distance * 10)
