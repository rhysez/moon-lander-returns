extends StaticBody2D

const MAX_LINEAR_VELOCITY: float = 50.0

func has_won(linear_velocity: Vector2, lander) -> bool:
	# Handles bug where Y velocity will sometimes evaluate to negative value.
	# This would sometimes allow the player to win.
	if linear_velocity.y < 0:
		push_warning("Loss!", linear_velocity.y)
		get_tree().current_scene.get_node("%WinLossLabel").text = "You ate lunar rocks!"
		lander.queue_free()
		return false
	
	if linear_velocity.y <= MAX_LINEAR_VELOCITY:
		push_warning("Win! ", linear_velocity.y)
		get_tree().current_scene.get_node("%WinLossLabel").text = "One big leap for humanity!"
		return true
	else:
		push_warning("Loss!", linear_velocity.y)
		get_tree().current_scene.get_node("%WinLossLabel").text = "You ate lunar rocks!"
		lander.queue_free()
		return false
