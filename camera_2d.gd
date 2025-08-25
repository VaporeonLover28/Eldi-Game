extends Camera2D

@onready var game = $"../../"

@export var drag_sensitivity: float = 1.0
@export var settable_limit_left: int = -400
@export var settable_limit_right: int = 1600
@export var settable_limit_top: int = -300
@export var settable_limit_bottom: int = 900
@export var smoothing_speed: float = 5.0  # Controls how quickly the camera slows down
@export var inertia_enabled: bool = true  # Toggle inertia effect

var _dragging = false
var _previous_position: Vector2
var _velocity: Vector2 = Vector2.ZERO  # Track current velocity
var _target_position: Vector2  # Target position for smoothing

func _ready():
	_target_position = position  # Initialize target position
	# Set camera limits if defined
	set_limit(SIDE_LEFT, settable_limit_left)
	set_limit(SIDE_RIGHT, settable_limit_right)
	set_limit(SIDE_TOP, settable_limit_top)
	set_limit(SIDE_BOTTOM, settable_limit_bottom)

func _unhandled_input(event: InputEvent):
	if !game.minigame_started:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			_dragging = event.pressed
			if _dragging:
				_previous_position = event.position
				_velocity = Vector2.ZERO  # Reset velocity when starting new drag
			else:
				_target_position = position
			get_tree().root.set_input_as_handled()
		elif event is InputEventMouseMotion and _dragging:
			var current_position = event.position
			var movement = (_previous_position - current_position) * zoom * drag_sensitivity
			position += movement
			# Update velocity based on movement for inertia
			_velocity = movement / get_process_delta_time()
			_previous_position = current_position
			get_tree().root.set_input_as_handled()

func _process(delta):
	if not _dragging and inertia_enabled and _velocity.length() > 0:
		_target_position += _velocity * delta
		position = position.lerp(_target_position, smoothing_speed * delta)
		_velocity = _velocity.lerp(Vector2.ZERO, smoothing_speed * delta)
		if _velocity.length() < 5:
			_velocity = Vector2.ZERO
