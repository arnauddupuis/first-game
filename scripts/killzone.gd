extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	DataManager.remove_points(10)
	print("You died painfully and violently!")
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
