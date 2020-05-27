extends Actor

onready var anim: = get_node("AnimatedSprite3D")


func _physics_process(delta):
	var direction: = get_direction()
	if direction.x != 0.0: anim.play("Run") 
	else: 
		anim.play("Idle")
	
	
	if Input.is_action_pressed("move_right"):
		anim.flip_h=false
	if Input.is_action_pressed("move_left"):
		anim.flip_h=true


	

	
	is_jump_interrupted = Input.is_action_just_released("move_jump")
	velocity = calculate_move_velocity(velocity, direction, speed, is_jump_interrupted)


func get_direction() -> Vector3:
	return Vector3(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("move_jump") and is_on_floor() else 1.0
		, 0.0
	)
	
