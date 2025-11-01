extends Area3D

signal ball_collected

func _on_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("ball_collected")
		queue_free()
