extends Node2D

@onready var score_label = $ScoreLabel


func _ready():
	score_label.text = "Your score is " + str(DataManager.get_points())
