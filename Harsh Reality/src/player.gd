extends Actor

func _physics_process(delta):
	var direction: = get_direction()
	is_jump_interrupted = Input.is_action_just_released("move_jump")
	velocity = calculate_move_velocity(velocity, direction, speed, is_jump_interrupted)


func get_direction() -> Vector3:
	return Vector3(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("move_jump") and is_on_floor() else 1.0
		, 0.0
	)

