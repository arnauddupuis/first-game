extends Node

@export var player : Node
@export var menu_pause : Node


func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		pause_menu()

func pause_menu():
	if get_tree().paused:
		menu_pause.hide()
		get_tree().paused = false
	else:
		menu_pause.show()
		get_tree().paused = true
