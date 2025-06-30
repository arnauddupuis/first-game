extends Control

@onready var game_core_manager = %GameCoreManager

func _on_resume_button_pressed():
	game_core_manager.pause_menu()


func _on_back_to_main_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu_main.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
