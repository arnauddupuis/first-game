extends Area2D

@onready var animation_player = $AnimationPlayer

func _on_body_entered(_body):
	DataManager.add_points(1)
	animation_player.play("pickup")
