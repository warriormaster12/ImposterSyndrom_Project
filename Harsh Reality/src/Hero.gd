extends Actor
var direction: = Vector3(-1.0,0.0,0.0)

func _physics_process(delta):
	direction = get_direction(direction)
	if direction.x == 1.0: 
		get_node("Sprite").flip_h = false 
	else:  
		get_node("Sprite").flip_h = true
	is_jump_interrupted = Input.is_action_just_released("move_jump")
	velocity = calculate_move_velocity(velocity, direction, speed, is_jump_interrupted)


func get_direction(direction: Vector3) -> Vector3:
	var newVector3: = direction
	if direction.x == 1.0 and is_on_wall():
		 newVector3.x = -1.0
	if direction.x == -1.0 and is_on_wall():
		 newVector3.x = 1.0
	newVector3.z = 0.0
	return newVector3
