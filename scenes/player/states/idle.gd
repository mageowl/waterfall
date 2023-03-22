class_name PlayerIdleState extends PlayerState

func _process_state(delta):
	# Handle Jump.
	if Input.is_action_just_pressed("jump"):
		change_state.emit("Jump")
	
	if not player.is_on_floor():
		change_state.emit("Fall")
	
	var direction = Input.get_axis("left", "right")
	if direction != 0:
		change_state.emit("Walk")
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, Player.SPEED)
