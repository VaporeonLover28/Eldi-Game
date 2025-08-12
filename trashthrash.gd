extends CharacterBody2D

var moving := true

const SPEED = 100

func _physics_process(delta: float) -> void:
	if moving:
		velocity.x = -SPEED
	
	move_and_slide()
