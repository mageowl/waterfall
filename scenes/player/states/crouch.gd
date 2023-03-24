class_name PlayerCrouchState extends PlayerState

func _process_state(delta):
	# Handle Jump.
	if Input.is_action_just_pressed("jump"):
		change_state("Jump")
	
	if not player.is_on_floor():
		change_state("Fall")
	
#	Handle Crouch button
	if not Input.is_action_pressed("crouch"):
		change_state("Idle")
	
#	Handle Dive
	player.can_dive = true
	if Input.is_action_pressed("dive"):
		change_state("Dive")
	
	var direction = Input.get_axis("left", "right")
	if direction != 0:
		player.velocity.x = Player.CROUCH_SPEED * direction
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, Player.SPEED)

func _get_animation_properties():
	var result = {
		"in_air": false,
		"is_crouching": true
	}
	
	if player.velocity.x != 0: 
		result.flip_h = true if player.velocity.x < 0 else false
		result.walk_scale = absf(player.velocity.x / Player.SPEED)
	
	return result
