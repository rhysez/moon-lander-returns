extends Node2D

#func _on_game_result(result: String) -> void:
	#match result:
		#"win":
			#%WinLossLabel.text = "One big leap for humanity!"
		#"loss":
			#%WinLossLabel.text = "You ate lunar rocks!"

func _ready():
	spawn_landing_site()

func spawn_landing_site():
	var new_landing_site = preload("res://scenes/landing_site.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_landing_site.global_position = %PathFollow2D.global_position
	add_child(new_landing_site)
