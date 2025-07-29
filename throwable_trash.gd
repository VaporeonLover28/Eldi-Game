extends RigidBody2D

@onready var arc_line: Line2D = $"../Arc"
@onready var mouse_position = get_viewport().get_mouse_position()
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
	pulling_distance = mouse_position - self.global_position
	dir = (mouse_position - self.global_position).normalized()
	if mouse_position.distance_to(self.global_position) > 100:
		pulling_distance =  dir * 500 + self.global_position
	var calculated_velocity = ((pulling_distance * dir)/10000 * pulling_distance)
	arc_line.clear_points()
	var inicial_point = self.global_position
	for item in 50000:
		arc_line.add_point(inicial_point)
		inicial_point.y += 1 * delta
		inicial_point += calculated_velocity * delta
		if inicial_point.y > 380:
			print("oi")
			break

func _throw():
	was_throwed = true
	freeze = false
	var vel = mouse_position - self.global_position
	self.apply_impulse(vel * 2)
