extends Node

## Here we define our custom signals.
# This signal is emitted each time the score is changed.
signal score_value_changed(score:int)

## Here we define our variables
var score = 0


# This function adds points to the score and emit the score_value_changed
# signal when it's done.
func add_points(value:int = 1):
	score += value
	emit_signal("score_value_changed", score)

# This function remove points from the score and emit the score_value_changed
# signal when it's done.
func remove_points(value:int = 1):
	score = max(0, score - value)
	emit_signal("score_value_changed", score)

# This function returns the current score.
func get_points() -> int:
	return score
