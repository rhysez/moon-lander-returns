extends RigidBody2D

const TORQUE: float = 20
const ROTATION_SPEED: float = 80
var rotation_direction: float = 0
var thrust = Vector2(0, -450)
var l_velocity = Vector2.ZERO

@onready var sprite: Sprite2D = %Lander
const SPRITE_IDLE = preload("res://assets/lander/lander.png")
const SPRITE_THRUSTING = preload("res://assets/lander/lander-thrust.png")

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if Input.is_action_pressed("thrust"):
		state.apply_force(thrust.rotated(rotation))
		sprite.texture = SPRITE_THRUSTING
	else:
		sprite.texture = SPRITE_IDLE
	
	if Input.is_action_pressed("tilt_right"):
		rotation_direction += 2
	if Input.is_action_pressed("tilt_left"):
		rotation_direction -= 2
	
	state.apply_torque(rotation_direction * TORQUE)
	l_velocity = state.linear_velocity
	%VelocityLabel.text = "Velocity: %s" % snapped(l_velocity.y, 0.01)

func _on_body_entered(body: Node) -> void:
	if body.has_method("has_won"):
		body.has_won(l_velocity, self)
	else:
		queue_free()
		get_tree().current_scene.get_node("%WinLossLabel").text = "You ate lunar rocks!"
