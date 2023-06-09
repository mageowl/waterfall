class_name PlayerJumpState extends PlayerState

func _process_state(delta):
	if player.is_on_floor():
		change_state("Idle")
	else:
		player.velocity.y += Player.GRAVITY_JUMP * delta
	
	if player.velocity.y >= 0:
		change_state("Fall")
	
#	Handle Dive
	if Input.is_action_pressed("dive") and player.can_dive:
		change_state("Dive")
	
#	Get walk direction
	var direction = Input.get_axis("left", "right")
	if direction == 0:
		player.velocity.x = move_toward(player.velocity.x, 0, Player.SPEED * Player.FRICTION_AIR)
	else:
		player.velocity.x = Player.SPEED * direction

func _enter_state(from: String):
	if player.velocity.y > 0: player.velocity.y = 0
	player.velocity.y -= Player.JUMP_VELOCITY

func _get_animation_properties():
	var result = {
		"in_air": true,
		"is_crouching": false,
		"is_diving": false
	}
	if player.velocity.x != 0: result.flip_h = true if player.velocity.x < 0 else false
	
	return result
