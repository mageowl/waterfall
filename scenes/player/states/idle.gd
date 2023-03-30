class_name PlayerIdleState extends PlayerState

func _process_state(delta):
	# Handle Jump.
	if Input.is_action_just_pressed("jump"):
		change_state("Jump")
	
#	Handle Crouch button
	if Input.is_action_pressed("crouch"):
		change_state("Crouch")
	
#	Handle Dive
	player.can_dive = true
	if Input.is_action_pressed("dive"):
		change_state("Dive")
	
	if not player.is_on_floor():
		change_state("Fall")
	
	var direction = Input.get_axis("left", "right")
	if direction != 0:
		change_state("Walk")
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, Player.SPEED)

func _get_animation_properties():
	return {
		"in_air": false,
		"is_crouching": false,
		"is_diving": false,
		"has_dash": true
	}
