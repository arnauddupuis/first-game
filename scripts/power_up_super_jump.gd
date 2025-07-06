extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(_body: Node2D) -> void:
	print("PowerUpSuperJump entered")
	DataManager.jump_velocity_modifier += 0.25
	animation_player.play("pickup")
