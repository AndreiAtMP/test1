extends Control

@onready var score_label = $ScoreLabel
@onready var speed_label = $SpeedLabel

func update_score(score):
	score_label.text = "Score: " + str(score)

func update_speed(speed):
	speed_label.text = "Speed: " + str(speed)
