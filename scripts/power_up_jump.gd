extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	queue_free()
	DataManager.jump_velocity_modifier += 0.1
