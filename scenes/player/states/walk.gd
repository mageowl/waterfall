class_name PlayerWalkState extends PlayerState

func _process_state(delta: float):
#	Handle Jump button
	if Input.is_action_just_pressed("jump"):
		change_state("Jump")
	elif not player.is_on_floor():
		change_state("Fall")
	
#	Handle Crouch button
	if Input.is_action_pressed("crouch"):
		change_state("Crouch")
	
#	Get walk direction
	var direction = Input.get_axis("left", "right")
	if direction == 0:
		change_state("Idle")
	else:
		player.velocity.x = Player.SPEED * direction

func _get_animation_properties():
	if player.velocity.x == 0: return super._get_animation_properties()
	return {
		"in_air": false,
		"walk_scale": absf(player.velocity.x / Player.SPEED),
		"flip_h": true if player.velocity.x < 0 else false,
		"is_crouching": false
	}
