extends RigidBody3D

@export var stroke_turn_speed = 7
@export var stroke_change_power_speed = 5
@export var min_stroke_strength = 5
@export var max_stroke_strength = 50

var stroke_power = 5
var stroke_direction = Vector2(0, 1)

func _integrate_forces(state):
	if Input.is_action_just_pressed("stroke"):
		##if grounded and no velocity
		apply_impulse(Vector3(stroke_direction.x, .2, stroke_direction.y) * stroke_power)
	


func _process(delta):
	var delta_power = 0
	var delta_angle = 0

	# We check for each move input and update the direction accordingly.
	if Input.is_action_pressed("power_down"):
		delta_power -= stroke_change_power_speed
	if Input.is_action_pressed("power_up"):
		delta_power += stroke_change_power_speed
	if Input.is_action_pressed("aim_left"):
		delta_angle += stroke_turn_speed
	if Input.is_action_pressed("aim_right"):
		delta_angle -= stroke_turn_speed
		
	stroke_power = clamp(stroke_power + delta_power * delta, min_stroke_strength, max_stroke_strength)
	stroke_direction = stroke_direction.rotated(delta_angle)
