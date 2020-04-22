extends Actor
var direction: = Vector2(-1.0,0.0)

func _physics_process(delta):
	direction = get_direction(direction)
	is_jump_interrupted = Input.is_action_just_released("move_jump")
	velocity = calculate_move_velocity(velocity, direction, speed, is_jump_interrupted)


func get_direction(direction: Vector2) -> Vector2:
	var newVector2: = direction
	if direction.x == 1.0 and is_on_wall():
		 newVector2.x = -1.0
	if direction.x == -1.0 and is_on_wall():
		 newVector2.x = 1.0
	return newVector2
