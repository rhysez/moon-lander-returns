extends RigidBody2D

const TORQUE: float = 20
const ROTATION_SPEED: float = 80
var rotation_direction: float = 0
var thrust = Vector2(0, -450)

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if Input.is_action_pressed("thrust"):
		state.apply_force(thrust.rotated(rotation))
	
	if Input.is_action_pressed("tilt_right"):
		rotation_direction += 2
	if Input.is_action_pressed("tilt_left"):
		rotation_direction -= 2
	
	state.apply_torque(rotation_direction * TORQUE)
