extends Node3D



func _on_rigid_body_3d_pin_knocked_over():
	await get_tree().create_timer(1.0).timeout
	queue_free()
