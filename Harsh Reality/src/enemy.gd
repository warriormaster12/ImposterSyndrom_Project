extends Actor
class_name Enemy

onready var target: = get_parent().get_node("Player")

func _physics_process(delta):
	var direction: = get_direction()
	velocity = calculate_move_velocity(velocity, direction, speed, is_jump_interrupted)


func get_direction() -> Vector3:
	return Vector3(
		-1.0 if position > target.position else 1.0
		,1.0
		,0.0
	)
