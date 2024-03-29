extends Marker3D

@export var camera_speed = 20


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("pan_left"):
		direction.x -= camera_speed
	if Input.is_action_pressed("pan_right"):
		direction.x += camera_speed
	if Input.is_action_pressed("pan_down"):
		direction.z += camera_speed
	if Input.is_action_pressed("pan_up"):
		direction.z -= camera_speed
		
	translate(delta * direction)
