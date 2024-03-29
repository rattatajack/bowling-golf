extends RigidBody3D

@export var angle_tolerance = .2
@export var velocity_tolerance = .1
@export var angular_velocity_tolerance = .1


func is_knocked_over():
	return (
		rotation.length_squared() > angle_tolerance 
		and linear_velocity.length_squared() < velocity_tolerance
		and angular_velocity.length_squared() < angular_velocity_tolerance
		)

func _physics_process(delta):
	if is_knocked_over():
		print(rotation, rotation.length())
		#emit_signal("pin_knocked_over")
		get_parent().queue_free()
