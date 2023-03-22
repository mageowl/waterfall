class_name PlayerJumpState extends PlayerState

func _process_state(delta):
	if player.is_on_floor():
		change_state.emit("Idle")
	else:
		player.velocity.y += Player.GRAVITY_JUMP * delta
	
	if player.velocity.y >= 0:
		change_state.emit("Fall")
	
#	Get walk direction
	var direction = Input.get_axis("left", "right")
	if direction == 0:
		player.velocity.x = move_toward(player.velocity.x, 0, Player.SPEED)
	else:
		player.velocity.x = Player.SPEED * direction

func _enter_state():
	player.velocity.y = -Player.JUMP_VELOCITY
