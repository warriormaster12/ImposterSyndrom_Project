extends KinematicBody
class_name Actor

export var speed: = Vector3(20.0, 50.0, 0.0)
export var maxspeed: = Vector3(20.0, 1000.0, 0.0)
export var gravity: = 20.0
export var is_jump_interrupted: = false
var velocity: = Vector3.ZERO
const FLOOR_NORMAL: = Vector3.UP


func _physics_process(delta):
	velocity = move_and_slide(velocity, FLOOR_NORMAL)
	

func calculate_move_velocity(
	linear_velocity: Vector3,
	direction: Vector3,
	speed: Vector3,
	is_jump_interrupted: bool
) -> Vector3:
	var new_velocity = linear_velocity
	new_velocity.x = speed.x * direction.x
#	new_velocity.x = clamp(velocity.x + speed.x * direction.x, maxspeed.x * -1.0, maxspeed.x)
#	if direction.x == 0:
#		if new_velocity.x >= 0:
#			new_velocity.x =  max(new_velocity.x - speed.x, 0.0)
#		else:
#			new_velocity.x =  min(new_velocity.x + speed.x, 0.0)
	new_velocity.y += -gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		new_velocity.y = -speed.y * direction.y
	if is_jump_interrupted:
		new_velocity.y = max(new_velocity.y, 0.0)
	return new_velocity
