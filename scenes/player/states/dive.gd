class_name PlayerDiveState extends PlayerState

var time_left = Player.DIVE_LENGTH

func _enter_state(from: String):
	time_left = Player.DIVE_LENGTH
	player.can_dive = false
#	player.camera.position_smoothing_enabled = false

func _exit_state():
#	player.camera.position_smoothing_enabled = true
	pass

func get_mouse_angle():
	return (player.get_local_mouse_position()).normalized()

func _process_state(delta):
	if player.get_slide_collision_count() > 0 and time_left < Player.DIVE_LENGTH:
		change_state("Fall")
	
	if Input.is_action_just_pressed("jump"):
		change_state("Jump")
	
	if not Input.is_action_pressed("dive"):
		change_state("Fall")
	
	player.velocity = get_mouse_angle() * Player.DIVE_SPEED
	
	time_left -= delta
	if time_left <= 0:
		change_state("Fall")

func _get_animation_properties():
	return {
		"is_diving": true,
		"has_dash": false,
		"dive_rotation": get_mouse_angle().angle() + 0.25 * TAU,
		"in_air": false
	}
