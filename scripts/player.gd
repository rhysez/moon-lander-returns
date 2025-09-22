extends RigidBody2D

const MAX_MOVEMENT_SPEED: int = 400
const ROTATION_SPEED: float = 1.5

var rotation_direction: int = 0

func get_input() -> void:
	rotation_direction = Input.get_axis("tilt_left", "tilt_right")
	# velocity = transform.y * Input.get_axis("thrust", "") * MAX_MOVEMENT_SPEED

# Lander should move in the direction it is facing on thrust action.
# Lander should tilt right and left on tilt_right and tilt_left actions
func _physics_process(delta: float) -> void:
	get_input()
	rotation += rotation_direction * ROTATION_SPEED * delta
	# move_and_slide()
