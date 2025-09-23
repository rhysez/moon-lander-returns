extends StaticBody2D

const MAX_LINEAR_VELOCITY: float = 50.0

func has_won(linear_velocity: Vector2, lander) -> bool:
	if linear_velocity.y <= MAX_LINEAR_VELOCITY:
		push_warning("Win! ", linear_velocity.y)
		return true
	else:
		push_warning("Loss!", linear_velocity.y)
		lander.queue_free()
		return false
