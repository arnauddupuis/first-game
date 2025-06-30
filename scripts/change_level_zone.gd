extends Area2D

@export_file("*.tscn") var scene_to_go_to: String


func _on_body_entered(_body):
	DataManager.add_points(10)
	print("Something entered the level changer, let's go to scene: "+scene_to_go_to)
	get_tree().change_scene_to_file(scene_to_go_to)
