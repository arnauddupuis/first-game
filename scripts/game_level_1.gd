extends Node2D

@onready var game_core_manager = %GameCoreManager
@onready var score_label = $Labels/ScoreLabel

func _ready():
	DataManager.score_value_changed.connect(_on_score_changed)
	score_label.text = "Your score is " + str(DataManager.get_points())

func _on_score_changed(score):
	score_label.text = "Your score is " + str(score)
