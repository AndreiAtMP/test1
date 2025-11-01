extends CharacterBody3D

@export var speed = 10.0
@export var pitch_speed = 1.0
@export var roll_speed = 1.5
@export var yaw_speed = 0.5
@export var speed_change_rate = 2.0

var score = 0
@onready var ui = get_node("/root/Main/CanvasLayer/UI")

func _ready():
	add_to_group("player")
	ui.update_score(score)
	ui.update_speed(speed)

func _physics_process(delta):
	var rot = Vector3.ZERO

	if Input.is_action_pressed("move_up"):
		rot.x += pitch_speed * delta
	if Input.is_action_pressed("move_down"):
		rot.x -= pitch_speed * delta
	if Input.is_action_pressed("move_left"):
		rot.z += roll_speed * delta
	if Input.is_action_pressed("move_right"):
		rot.z -= roll_speed * delta

	if Input.is_action_pressed("increase_speed"):
		speed += speed_change_rate * delta
	if Input.is_action_pressed("decrease_speed"):
		speed -= speed_change_rate * delta
		speed = max(0, speed)

	rotate_object_local(Vector3(1, 0, 0), rot.x)
	rotate_object_local(Vector3(0, 0, 1), rot.z)
	rotate_object_local(Vector3(0, 1, 0), rot.y)

	velocity = -transform.basis.z * speed
	move_and_slide()
	ui.update_speed(velocity.length())


func _on_ball_collected():
	score += 1
	ui.update_score(score)
