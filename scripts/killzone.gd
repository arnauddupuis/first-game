extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	# Remove 10 points to the score on death
	DataManager.remove_points(10)
	# Debuf the jump velocity modifier by 50% (up to a minimum of 1.0)
	DataManager.jump_velocity_modifier = max(1.0, DataManager.jump_velocity_modifier * 0.5)
	print("You died painfully and violently! Your bonuses have been halved!")
	print("Jump velocity modifier: ", str(DataManager.jump_velocity_modifier))
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
