extends RigidBody2D

const TORQUE: float = 100
const ROTATION_SPEED: float = 80
var rotation_direction: int = 0
var thrust = Vector2(0, -450)

# Lander should move in the direction it is facing on thrust action.
# Lander should tilt right and left on tilt_right and tilt_left actions
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if Input.is_action_pressed("thrust"):
		state.apply_force(thrust.rotated(rotation))
	
	if Input.is_action_pressed("tilt_right"):
		rotation_direction += 1
	if Input.is_action_pressed("tilt_left"):
		rotation_direction -= 1
	
	state.apply_torque(rotation_direction * TORQUE)
