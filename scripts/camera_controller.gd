extends Node

@onready var third_person_camera = $"../ThirdPersonCamera"
@onready var first_person_camera = $"../Cabin/Camera3D"

func _ready():
	third_person_camera.make_current()
	first_person_camera.current = false

func _unhandled_input(event):
	if event.is_action_pressed("switch_camera"):
		if third_person_camera.is_current():
			first_person_camera.make_current()
		else:
			third_person_camera.make_current()
