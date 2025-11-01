extends Control

@onready var score_label = $ScoreLabel
@onready var speed_label = $SpeedLabel

func update_score(score):
	if score_label:
		score_label.text = "Score: " + str(score)

func update_speed(speed):
	if speed_label:
		speed_label.text = "Speed: " + str(speed)
