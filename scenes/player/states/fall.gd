class_name PlayerFallState extends PlayerState

func _process_state(delta):
	if player.is_on_floor():
		change_state("Idle")
	else:
		player.velocity.y += Player.GRAVITY * delta
	
#	Get walk direction
	var direction = Input.get_axis("left", "right")
	if direction == 0:
		player.velocity.x = move_toward(player.velocity.x, 0, Player.SPEED * Player.FRICTION_AIR)
	else:
		player.velocity.x = Player.SPEED * direction

func _get_animation_properties():
	var result = {
		"in_air": true
	}
	if player.velocity.x != 0: result.flip_h = true if player.velocity.x < 0 else false
	
	return result
